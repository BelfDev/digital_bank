import 'package:data_access/src/model/failure/error_feedback_type.dart';
import 'package:data_access/src/model/failure/failure_protocol.dart';

class RemoteApiFailure implements FailureProtocol {
  RemoteApiFailure._(this.feedbackType, this.message);

  RemoteApiFailure.clientError()
      : this._(
          ErrorFeedbackType.clientError,
          'Please review your input and try again.',
        );

  RemoteApiFailure.serverError()
      : this._(
          ErrorFeedbackType.serverError,
          'Something went wrong on our side. Please try again later.',
        );

  RemoteApiFailure.generic()
      : this._(
          ErrorFeedbackType.generic,
          'Oops! Something went wrong.',
        );

  final ErrorFeedbackType feedbackType;

  final String message;

  @override
  ErrorFeedbackType get errorFeedbackType => feedbackType;

  @override
  String toString() => message;
}
