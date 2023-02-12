import 'package:mockito/mockito.dart';

abstract class Callback {
  void call();
}

abstract class AsyncCallback {
  Future<void> call();
}

class MockCallback extends Mock implements Callback {}

class MockAsyncCallback extends Mock implements AsyncCallback {}

