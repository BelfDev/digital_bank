import 'package:data_access/data_access.dart';
import 'package:test/test.dart';

void main() {
  group('AccountApplicationFeedback:', () {
    test('should use value equality', () {
      final stub = AccountApplicationFeedbackStubs.defaultStub;
      final accountApplication = AccountApplicationFeedback(
        accountNumber: stub.accountNumber,
      );

      final accountApplication2 = AccountApplicationFeedback(
        accountNumber: stub.accountNumber,
      );

      final accountApplication3 = AccountApplicationFeedback(
        accountNumber: '1234142',
      );

      expect(accountApplication == accountApplication2, isTrue);
      expect(accountApplication == accountApplication3, isFalse);
    });

    test('toJson should return the expected Map<String, dynamic>', () {
      final stub = AccountApplicationFeedbackStubs.defaultStub;
      final feedback = AccountApplicationFeedback(
        accountNumber: stub.accountNumber,
      );

      final expectedResult = Map<String, dynamic>.from({
        'accountNumber': stub.accountNumber,
      });

      expect(feedback.toJson(), equals(expectedResult));
    });
  });
}
