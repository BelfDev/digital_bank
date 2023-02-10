import 'dart:convert';
import 'dart:typed_data';

import 'package:configs/configs.dart';
import 'package:convert/convert.dart';
import 'package:data_access/src/model/encrypted_data.dart';
import 'package:meta/meta.dart';
import 'package:pointycastle/export.dart' as pc;

enum CypherOperation { encrypt, decrypt }

mixin EncryptionService {
  @protected
  Future<String> encrypt(
    Object? object,
    EncryptionConfig cryptoConfig,
  ) async {
    final encodedJsonPayload = jsonEncode(object);
    final cypher = _createCypher(
      operation: CypherOperation.encrypt,
      encryptionConfig: cryptoConfig,
    );

    final data = Uint8List.fromList(utf8.encode(encodedJsonPayload));
    final encryptedData = cypher.process(data);

    return base64Encode(encryptedData);
  }

  @protected
  Future<String> decrypt(
    EncryptedData encryptedData,
    EncryptionConfig cryptoConfig,
  ) async {
    final cypher = _createCypher(
      operation: CypherOperation.decrypt,
      encryptionConfig: cryptoConfig,
    );

    final data = Uint8List.fromList(base64Decode(encryptedData.payload));
    final decryptedData = cypher.process(data);

    return String.fromCharCodes(decryptedData);
  }

  pc.PaddedBlockCipherImpl _createCypher({
    required CypherOperation operation,
    required EncryptionConfig encryptionConfig,
  }) {
    final secret = Uint8List.fromList(utf8.encode(encryptionConfig.secretKey));
    final iv = Uint8List.fromList(hex.decode(encryptionConfig.iv));
    final nonce = Uint8List.fromList(hex.decode(encryptionConfig.salt));

    final pbkdf2Derivator = pc.PBKDF2KeyDerivator(pc.HMac(pc.SHA1Digest(), 64))
      ..init(
        pc.Pbkdf2Parameters(
          nonce,
          encryptionConfig.iterations,
          encryptionConfig.keyBits ~/ 8,
        ),
      );

    final pbkdf2Key = pbkdf2Derivator.process(secret);

    return pc.PaddedBlockCipherImpl(
      pc.PKCS7Padding(),
      pc.CBCBlockCipher(pc.AESEngine()),
    )..init(
        operation == CypherOperation.encrypt,
        pc.PaddedBlockCipherParameters(
          pc.ParametersWithIV(pc.KeyParameter(pbkdf2Key), iv),
          null,
        ),
      );
  }
}
