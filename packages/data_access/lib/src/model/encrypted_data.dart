import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class EncryptedData with EquatableMixin {
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

  Map<String, dynamic> toJson() {
    return {
      'encryptedRequest': payload,
    };
  }

  @override
  List<Object?> get props => [payload];
}
