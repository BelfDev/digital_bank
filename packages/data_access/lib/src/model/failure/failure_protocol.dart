import 'package:data_access/src/model/failure/error_feedback_type.dart';

abstract class FailureProtocol implements Exception {
  const FailureProtocol(this.errorFeedbackType);

  final ErrorFeedbackType errorFeedbackType;

  @override
  String toString() => 'Oops! Something went wrong.';
}
