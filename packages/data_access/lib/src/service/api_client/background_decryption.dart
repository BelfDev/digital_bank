import 'dart:convert';
import 'dart:isolate';

import 'package:configs/configs.dart';
import 'package:data_access/src/service/encryption/encryption_service.dart';

import '../../model/encrypted_data.dart';

class BackgroundDecryption<T> with EncryptionService {
  const BackgroundDecryption(
    this._encryptedJson,
    this._encryptionConfig,
  );

  final String _encryptedJson;
  final EncryptionConfig _encryptionConfig;

  Future<T> decryptInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(_decodeAndDecrypt, p.sendPort);
    return await p.first;
  }

  Future<void> _decodeAndDecrypt(SendPort p) async {
    final encryptedJson = jsonDecode(_encryptedJson);
    final encryptedData = EncryptedData.fromJson(encryptedJson);
    final decryptedPayload = await decrypt(encryptedData, _encryptionConfig);
    Isolate.exit(p, decryptedPayload);
  }
}
