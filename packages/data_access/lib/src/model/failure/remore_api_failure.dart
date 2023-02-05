import 'package:data_access/src/model/failure/failure_protocol.dart';

class RemoteApiFailure implements FailureProtocol {
  @override
  String toString() {
    // TODO(BelfDev): provide appropriate localization
    return 'Oops! Something went wrong.';
  }
}
