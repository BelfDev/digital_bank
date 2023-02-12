import 'package:configs/configs.dart';
import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/failure/remote_api_failure.dart';
import 'package:data_access/src/service/encryption/background_decryption.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import '../encryption/background_encryption.dart';
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

class FlowBankApiClientService implements FlowBankApiClientServiceProtocol {
  FlowBankApiClientService(
    this._environment, {
    HttpClientProtocol? client,
  })  : _baseUrl = _environment.flowBankApiBaseUrl,
        _httpClient = client ?? HttpClient();

  final Environment _environment;
  final String _baseUrl;
  final HttpClientProtocol _httpClient;

  static Provider<FlowBankApiClientService> provider =
      _apiClientServiceProvider;

  @override
  Future<AccountApplicationFeedback> createAccount(
    AccountApplication accountApplication,
  ) async {
    final cryptoConfig = _environment.encryptionConfig;
    try {
      final encryptedData = await BackgroundEncryption(
        accountApplication,
        cryptoConfig,
      ).encryptInBackground();

      final response = await _httpClient.post(
        _baseUrl,
        'account',
        body: encryptedData,
      );

      if (response.statusCode == 200) {
        final decryptedData = await BackgroundDecryption<String>(
          response.body,
          cryptoConfig,
        ).decryptInBackground();

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
