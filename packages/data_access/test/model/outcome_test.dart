import 'package:data_access/data_access.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:test/test.dart';

void main() {
  group('Outcome:', () {
    test('gets the data when it is Success result', () {
      const data = 'Some data';
      final outcome = Outcome.success(data);
      expect(outcome.data, equals(data));
    });

    test('data returns null when it is Failure result', () {
      final outcome = Outcome.failure(RemoteApiFailure.generic());
      expect(outcome.data, isNull);
    });

    test('`isSuccess` returns true for Success result', () {
      const data = 'Some data';
      final outcome = Outcome.success(data);
      expect(outcome.isSuccess, isTrue);
    });

    test('`isSuccess` returns false for Failure result', () {
      final outcome = Outcome.failure(RemoteApiFailure.generic());
      expect(outcome.isSuccess, isFalse);
    });

    test('isFailure returns true for Failure result', () {
      final outcome = Outcome.failure(RemoteApiFailure.clientError());
      expect(outcome.isFailure, isTrue);
    });

    test('isFailure returns false for Success result', () {
      final outcome = Outcome.success('Some data');
      expect(outcome.isFailure, isFalse);
    });

    test('gets error when it is Failure result', () {
      final outcome = Outcome.failure(RemoteApiFailure.clientError());
      expect(outcome.error, equals(RemoteApiFailure.clientError()));
    });

    test('failure returns null when it is Success result', () {
      final outcome = Outcome.success('Some data');
      expect(outcome.error, isNull);
    });
  });

  group('DataResult', () {
    test('should be equal when two success objects have equal data', () {
      const data = 'Some data';
      final outcome = Outcome.success(data);
      const data2 = 'Some data';
      final outcome2 = Outcome.success(data2);
      expect(outcome == outcome2, isTrue);
    });

    test('should not be equal when two success objects have different data',
        () {
      const data = 'Some data';
      final outcome = Outcome.success(data);
      const data2 = 'Some different data';
      final outcome2 = Outcome.success(data2);
      expect(outcome == outcome2, isFalse);
    });

    test('should be equal when two failure objects have equal error', () {
      final outcome = Outcome.failure(RemoteApiFailure.clientError());
      final outcome2 = Outcome.failure(RemoteApiFailure.clientError());
      expect(outcome == outcome2, isTrue);
    });

    test('should not be equal when two failure objects have different error',
        () {
      final outcome = Outcome.failure(RemoteApiFailure.generic());
      final outcome2 = Outcome.failure(RemoteApiFailure.clientError());
      expect(outcome == outcome2, isFalse);
    });
  });

  group('Outcome fold', () {
    test('transforms failure into a false bool', () {
      final result = Outcome.failure<String>(RemoteApiFailure.generic())
          .fold<bool>((failure) => false, (data) => true);

      expect(result, isFalse);
    });

    test('transforms data into a true bool', () {
      final result = Outcome.success('Example data')
          .fold<bool>((failure) => false, (data) => true);

      expect(result, isTrue);
    });
  });
}
