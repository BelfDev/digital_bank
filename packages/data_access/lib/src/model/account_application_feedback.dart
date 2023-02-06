import 'package:meta/meta.dart';

@immutable
class AccountApplicationFeedback {
  const AccountApplicationFeedback({
    required this.accountNumber,
  });

  final String accountNumber;

  static AccountApplicationFeedback fromJson(Map<String, dynamic> data) {
    return AccountApplicationFeedback(
      accountNumber: data['accountNumber'],
    );
  }
}
