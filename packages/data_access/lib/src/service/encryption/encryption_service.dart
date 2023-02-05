import 'dart:convert';

mixin EncryptionService {
  String encrypt(Object? object) {
    final encodedJsonPayload = jsonEncode(object);
    return 'encrypted_data';
  }
}
