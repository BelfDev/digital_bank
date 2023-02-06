import 'package:data_access/src/model/failure/failure_protocol.dart';

// TODO(BelfDev): provide appropriate localization
class RemoteApiFailure implements FailureProtocol {
  RemoteApiFailure._(this.message);

  RemoteApiFailure.generic() : this._('Oops! Something went wrong.');

  RemoteApiFailure.serverError()
      : this._('Something went wrong on our side. Please try again later.');

  RemoteApiFailure.clientError()
      : this._('Please review your input and try again.');

  final String message;

  @override
  String toString() => message;
}
