import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:configs/configs.dart';
import 'package:data_access/src/service/encryption/encryption_service.dart';

import '../../model/encrypted_data.dart';

class BackgroundEncryption<T> with EncryptionService {
  const BackgroundEncryption(
    this._unencryptedData,
    this._encryptionConfig,
  );

  final T _unencryptedData;
  final EncryptionConfig _encryptionConfig;

  Future<EncryptedData> encryptInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(_encrypt, p.sendPort);

    return await p.first;
  }

  Future<void> _encrypt(SendPort p) async {
    final encryptedPayload = await encrypt(_unencryptedData, _encryptionConfig);
    final encryptedData = EncryptedData(payload: encryptedPayload);
    Isolate.exit(p, encryptedData);
  }
}
