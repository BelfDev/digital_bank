import 'package:data_access/src/model/failure/error_feedback_type.dart';
import 'package:data_access/src/model/failure/failure_protocol.dart';
import 'package:equatable/equatable.dart';

class RemoteApiFailure extends FailureProtocol with EquatableMixin {
  RemoteApiFailure._(super.errorFeedbackType, this.message);

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

  final String message;

  @override
  String toString() => message;

  @override
  List<Object?> get props => [
        super.errorFeedbackType,
        message,
      ];
}
