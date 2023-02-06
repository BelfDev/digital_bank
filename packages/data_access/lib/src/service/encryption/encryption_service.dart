import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:data_access/src/model/encrypted_data.dart';
import 'package:encrypt/encrypt.dart';
import 'package:cryptography/cryptography.dart';
import 'package:pointycastle/export.dart' as pc;

// TODO(BelfDev): Read from env variables
mixin EncryptionService {

  String encrypt(Object? object) {
    final encodedJsonPayload = jsonEncode(object);

    final secret = Uint8List.fromList(
      utf8.encode(''),
    );
    final iv = Uint8List.fromList(
      hex.decode('a715fed0af06cce82dcc1e69fc832cfe'),
    );
    final salt = Uint8List.fromList(
      utf8.encode('fa9b8ba73fe30d8dfcf4c59532148522'),
    );

    final nonce = Uint8List.fromList(
      hex.decode('fa9b8ba73fe30d8dfcf4c59532148522'),
    );

    // Generating the Key
    final pbkdf2Derivator = pc.PBKDF2KeyDerivator(
      pc.HMac(pc.SHA1Digest(), 64),
    );
    final pbkdf2Parameters = pc.Pbkdf2Parameters(nonce, 1000, 16);
    pbkdf2Derivator.init(pbkdf2Parameters);
    final key = pbkdf2Derivator.process(secret);

    // Generating the Cipher
    final paramsCbc = pc.PaddedBlockCipherParameters(
      pc.ParametersWithIV(pc.KeyParameter(key), iv),
      null,
    );

    final cipherCbc = pc.PaddedBlockCipherImpl(
      pc.PKCS7Padding(),
      pc.CBCBlockCipher(pc.AESEngine()),
    );


    // Encrypt
    cipherCbc.init(true, paramsCbc);

    final data = Uint8List.fromList(utf8.encode(encodedJsonPayload));
    final encrypted = cipherCbc.process(data);

    final base64Encoded = base64Encode(encrypted);

    final text = String.fromCharCodes(encrypted);

    print(text);

    // Decrypt
    final cbc = pc.PaddedBlockCipherImpl(
      pc.PKCS7Padding(),
      pc.CBCBlockCipher(pc.AESEngine()),
    )..init(false, pc.PaddedBlockCipherParameters(
      pc.ParametersWithIV(pc.KeyParameter(key), iv),
      null,
    ));

    final decode = base64Decode('2sIbYPYjqwqoqYdiT7tif2X2riuUZFM5HaYUHHQKJAYtO4EPN72ViIR+gFZv/urHexAJqk0k7/n7/sBELQ4zmXhKO4cQLyeXjP5nd+m99Uf2eZRcqHdbWPO6EbzLCXpkTnELciME/mmNNdL4mO/VAsqiBUuSd3zr1FZyfbqCMwXlbuXtscVjtlxkVYni1CCy5oMewJmWm0kSiQdANTaROT5HWnOgv7ZqqUvrb8s8AADYh75HJePYTcqxQTqKqdhtydZzbuD8s27hRvCwftLBmqsm2PFNXeGYcWk5cNm7VU8=');
    final revData = Uint8List.fromList(decode);
    final decrypted = cbc.process(revData);

    final result = String.fromCharCodes(decrypted);

    print(decrypted);

    return result;
  }

  // String encrypt(Object? object) {
  //   final encodedJsonPayload = jsonEncode(object);
  //
  //   final secretKey = Key.fromUtf8('FF256FF256K');
  //   final encryptionIV = IV.fromUtf8('a715fed0af06cce82dcc1e69fc832cfe');
  //
  //   final encrypter = Encrypter(
  //     AES(
  //       secretKey,
  //       mode: AESMode.cbc,
  //       padding: 'PKCS7',
  //     ),
  //   );
  //
  //   final encrypted = encrypter.encrypt(
  //     encodedJsonPayload,
  //     iv: encryptionIV,
  //   );
  //
  //   print(encrypted.base64);
  //
  //   return encrypted.base64;
  // }

  String decrypt(EncryptedData encryptedData) {
    final decryptedJson = '{"accountNumber":"5339460"}';
    return decryptedJson;
  }
}
