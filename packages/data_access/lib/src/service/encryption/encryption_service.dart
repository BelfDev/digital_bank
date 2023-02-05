import 'dart:convert';

import 'package:data_access/src/model/encrypted_data.dart';

mixin EncryptionService {
  String encrypt(Object? object) {
    final encodedJsonPayload = jsonEncode(object);
    return 'encrypted_data';
  }

  String decrypt(EncryptedData encryptedData) {
    final decryptedJson = '{"accountNumber":"5339460"}';
    return decryptedJson;
  }
}
