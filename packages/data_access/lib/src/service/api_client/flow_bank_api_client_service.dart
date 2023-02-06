import 'dart:convert';

import 'package:configs/configs.dart';
import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/encrypted_data.dart';
import 'package:data_access/src/service/encryption/encryption_service.dart';
import 'package:meta/meta.dart';

import '../http_client/http_client.dart';
import 'background_json_parser.dart';

@immutable
class FlowBankApiClientService with EncryptionService {
  FlowBankApiClientService(
    Environment environment, {
    HttpClientProtocol? client,
  })  : baseUrl = environment.flowBankApiBaseUrl,
        httpClient = client ?? HttpClient();

  final String baseUrl;
  final HttpClientProtocol httpClient;

  Future<AccountApplicationFeedback> createAccount(
    AccountApplication accountApplication,
  ) async {
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
    } else {
      // TODO(BelfDev): Add proper error handling
      throw Exception('Failed to load json');
    }
  }
}
