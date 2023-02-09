import 'dart:convert';

import 'package:configs/configs.dart';
import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/encrypted_data.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:data_access/src/service/encryption/encryption_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import '../http_client/http_client.dart';
import 'background_json_parser.dart';

@immutable
abstract class FlowBankApiClientServiceProtocol {
  Future<AccountApplicationFeedback> createAccount(
    AccountApplication accountApplication,
  );
}

final _apiClientServiceProvider = Provider((ref) {
  return FlowBankApiClientService(
    Environment.current,
    client: HttpClient(),
  );
});

class FlowBankApiClientService
    with EncryptionService
    implements FlowBankApiClientServiceProtocol {
  FlowBankApiClientService(
    Environment environment, {
    HttpClientProtocol? client,
  })  : baseUrl = environment.flowBankApiBaseUrl,
        httpClient = client ?? HttpClient();

  final String baseUrl;
  final HttpClientProtocol httpClient;

  static Provider<FlowBankApiClientService> provider =
      _apiClientServiceProvider;

  @override
  Future<AccountApplicationFeedback> createAccount(
    AccountApplication accountApplication,
  ) async {
    try {
      final response = await httpClient.post(
        baseUrl,
        'account',
        body: EncryptedData(
          payload: encrypt(accountApplication),
        ),
      );

      if (response.statusCode == 200) {
        final encryptedJson = jsonDecode(response.body);
        final encryptedData = EncryptedData.fromJson(encryptedJson);

        final decryptedData = decrypt(encryptedData);
        final payloadParser = BackgroundJsonParser(
          decryptedData,
          AccountApplicationFeedback.fromJson,
        );

        return payloadParser.parseInBackground();
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        throw RemoteApiFailure.clientError();
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        throw RemoteApiFailure.serverError();
      } else {
        throw RemoteApiFailure.generic();
      }
    } catch (e) {
      rethrow;
    }
  }
}
