import 'package:meta/meta.dart';

import 'encryption_protocol.dart';

@immutable
class EncryptedData<T> implements EncryptionProtocol<T> {
  const EncryptedData({
    required this.payload,
  });

  final T payload;

  @override
  T decrypt(String input) {
    // TODO: implement decrypt
    throw UnimplementedError();
  }

  @override
  String encrypt(T input) {
    // TODO: implement encrypt
    throw UnimplementedError();
  }

// TODO(BelfDev): Implement toJson and fromJson
}
