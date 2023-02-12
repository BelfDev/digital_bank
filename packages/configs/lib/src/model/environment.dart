import 'package:configs/src/model/liveliness_check_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'encryption_config.dart';

enum Environment {
  test,
  production;

  const Environment();

  Future<void> init() async {
    if (dotenv.isInitialized && this != Environment.test) {
      throw Exception('Environment already initialized');
    } else if (this == Environment.test) {
      dotenv.testLoad(
        mergeWith: {
          'API_BASE_URL_PROD': 'https://api.flowbank.com/v1',
          'CRYPTO_SECRET_KEY': 'B4E66784B16',
          'CRYPTO_SECRET_SALT': '69ffa43dedb45e9e7b6f59b13a62ae62',
          'CRYPTO_SECRET_IV': '7e29d7d4af1e83e4ebd9801aa1296d57',
        },
      );
      return;
    }
    await dotenv.load(fileName: ".env");
  }

  static Environment get current => Environment.production;

  String get flowBankApiBaseUrl {
    _assertInitialized();

    switch (this) {
      case Environment.test:
      case Environment.production:
        return dotenv.env['API_BASE_URL_PROD']!;
    }
  }

  EncryptionConfig get encryptionConfig {
    _assertInitialized();

    switch (this) {
      case Environment.test:
      case Environment.production:
        return EncryptionConfig(
          secretKey: dotenv.env['CRYPTO_SECRET_KEY']!,
          salt: dotenv.env['CRYPTO_SECRET_SALT']!,
          iv: dotenv.env['CRYPTO_SECRET_IV']!,
          iterations: 1000,
          keyBits: 128,
        );
    }
  }

  LivelinessCheckConfig get livelinessCheckConfig {
    switch (this) {
      case Environment.test:
      case Environment.production:
        return LivelinessCheckConfig(
          photoPath: '/digital-bank/liveliness-check',
        );
    }
  }

  void _assertInitialized() {
    assert(
      dotenv.isInitialized,
      'Please ensure the environment is initialized before accessing it.',
    );
  }
}
