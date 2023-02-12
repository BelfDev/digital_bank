import 'package:mockito/mockito.dart';

abstract class Callback {
  void call();
}

class MockCallback extends Mock implements Callback {}
