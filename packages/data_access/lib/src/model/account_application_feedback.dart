import 'package:meta/meta.dart';

@immutable
class AccountApplicationFeedback {
  const AccountApplicationFeedback({
    required this.processNumber,
  });

  final String processNumber;
}
