import 'package:meta/meta.dart';

@immutable
class EncryptionConfig {
  EncryptionConfig({
    required this.secretKey,
    required this.salt,
    required this.iv,
    required this.iterations,
    required this.keyBits,
  });

  final String secretKey;
  final String salt;
  final String iv;
  final int iterations;
  final int keyBits;
}
