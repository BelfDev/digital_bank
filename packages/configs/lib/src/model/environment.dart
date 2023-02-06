import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'encryption_config.dart';

enum Environment {
  production;

  const Environment();

  Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static Environment get current => Environment.production;

  String get flowBankApiBaseUrl {
    _assertInitialized();

    switch (this) {
      case Environment.production:
        return dotenv.env['API_BASE_URL_PROD']!;
    }
  }

  EncryptionConfig get encryptionConfig {
    _assertInitialized();

    switch (this) {
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

  void _assertInitialized() {
    assert(
      dotenv.isInitialized,
      'Please ensure the environment is initialized before accessing it.',
    );
  }
}
