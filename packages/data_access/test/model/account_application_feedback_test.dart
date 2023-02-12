import 'package:data_access/data_access.dart';
import 'package:test/test.dart';

void main() {
  group('AccountApplication:', () {
    test('should set requestType to `new_account` by default', () {
      final stub = AccountApplicationStubs.defaultStub;
      final accountApplication = AccountApplication(
        firstName: stub.firstName,
        lastName: stub.lastName,
        birthDate: stub.birthDate,
        gender: stub.gender,
        photo: stub.photo,
        dependents: stub.dependents,
      );

      expect(accountApplication.requestType, equals('new_account'));
    });

    test('should use value equality', () {
      final stub = AccountApplicationStubs.defaultStub;
      final accountApplication = AccountApplication(
        firstName: stub.firstName,
        lastName: stub.lastName,
        birthDate: stub.birthDate,
        gender: stub.gender,
        photo: stub.photo,
        dependents: stub.dependents,
      );

      final accountApplication2 = AccountApplication(
        firstName: stub.firstName,
        lastName: stub.lastName,
        birthDate: stub.birthDate,
        gender: stub.gender,
        photo: stub.photo,
        dependents: stub.dependents,
      );

      final accountApplication3 = AccountApplication(
        firstName: 'Mary',
        lastName: 'Jane',
        birthDate: stub.birthDate,
        gender: stub.gender,
        photo: stub.photo,
        dependents: stub.dependents,
      );

      expect(accountApplication == accountApplication2, isTrue);
      expect(accountApplication == accountApplication3, isFalse);
    });

    test('toJson should return the expected Map<String, dynamic>', () {
      final stub = AccountApplicationStubs.defaultStub;
      final accountApplication = AccountApplication(
        firstName: stub.firstName,
        lastName: stub.lastName,
        birthDate: stub.birthDate,
        gender: stub.gender,
        photo: stub.photo,
        dependents: stub.dependents,
      );
      final expectedResult = Map<String, dynamic>.from(
        {
          'firstName': stub.firstName,
          'lastName': stub.lastName,
          'birthDate': stub.birthDate,
          'gender': stub.gender,
          'photo': stub.photo,
          'dependents': stub.dependents,
          'requestType': stub.requestType,
        },
      );

      expect(accountApplication.toJson(), equals(expectedResult));
    });
  });
}
