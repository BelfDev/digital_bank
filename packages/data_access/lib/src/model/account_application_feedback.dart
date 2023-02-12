import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AccountApplicationFeedback with EquatableMixin {
  const AccountApplicationFeedback({
    required this.accountNumber,
  });

  final String accountNumber;

  static AccountApplicationFeedback fromJson(Map<String, dynamic> data) {
    return AccountApplicationFeedback(
      accountNumber: data['accountNumber'],
    );
  }

  @visibleForTesting
  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
    };
  }

  @override
  List<Object?> get props => [
        accountNumber,
      ];
}

extension AccountApplicationFeedbackStubs on AccountApplicationFeedback {
  static AccountApplicationFeedback get defaultStub {
    return AccountApplicationFeedback(accountNumber: '7544939');
  }
}
