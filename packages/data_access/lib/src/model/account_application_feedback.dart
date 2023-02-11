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

extension AccountApplicationFeedbackStubs on AccountApplicationFeedback {
  static AccountApplicationFeedback get defaultStub {
    return AccountApplicationFeedback(
      accountNumber: '7544939'
    );
  }
}
