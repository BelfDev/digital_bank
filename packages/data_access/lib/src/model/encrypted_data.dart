import 'package:meta/meta.dart';

@immutable
class EncryptedData<T> {
  const EncryptedData({
    required this.payload,
  });

  final String payload;

  static EncryptedData fromJson(
    Map<String, dynamic> data,
  ) {
    return EncryptedData(
      payload: data['encryptedResponse'] as String,
    );
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> data,
  ) {
    return {
      'encryptedRequest': payload,
    };
  }
}
