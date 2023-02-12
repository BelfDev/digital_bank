import 'package:data_access/data_access.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<FlowBankApiClientServiceProtocol>()])
import 'account_repository_test.mocks.dart';

void main() {
  group('AccountRepository:', () {
    late MockFlowBankApiClientServiceProtocol mockApiClient;
    late AccountRepositoryProtocol repository;

    setUp(() {
      mockApiClient = MockFlowBankApiClientServiceProtocol();
      repository = AccountRepository(mockApiClient);
    });

    test(
      'when success then createAccount should return a data Outcome having AccountApplicationFeedback data',
      () async {
        final expectedResult = AccountApplicationFeedbackStubs.defaultStub;
        when(mockApiClient.createAccount(any)).thenAnswer(
          (_) async => expectedResult,
        );

        final result = await repository.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          isA<Outcome<AccountApplicationFeedback>>().having(
            (value) => value.data,
            'value.data',
            equals(expectedResult),
          ),
        );
      },
    );

    test(
      'when unmapped exception then createAccount should return a failure Outcome having RemoteApiFailure.generic error',
      () async {
        final expectedResult = RemoteApiFailure.generic();
        when(mockApiClient.createAccount(any)).thenThrow(
          Exception('Unmapped exception'),
        );

        final result = await repository.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          isA<Outcome<AccountApplicationFeedback>>().having(
            (value) => value.error,
            'value.error',
            equals(expectedResult),
          ),
        );
      },
    );

    test(
      'when generic exception then createAccount should return a failure Outcome having RemoteApiFailure.generic error',
      () async {
        final expectedResult = RemoteApiFailure.generic();
        when(mockApiClient.createAccount(any)).thenThrow(
          expectedResult,
        );

        final result = await repository.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          isA<Outcome<AccountApplicationFeedback>>().having(
            (value) => value.error,
            'value.error',
            equals(expectedResult),
          ),
        );
      },
    );

    test(
      'when clientError exception then createAccount should return a failure Outcome having RemoteApiFailure.clientError error',
      () async {
        final expectedResult = RemoteApiFailure.clientError();
        when(mockApiClient.createAccount(any)).thenThrow(
          expectedResult,
        );

        final result = await repository.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          isA<Outcome<AccountApplicationFeedback>>().having(
            (value) => value.error,
            'value.error',
            equals(expectedResult),
          ),
        );
      },
    );

    test(
      'when serverError exception then createAccount should return a failure Outcome having RemoteApiFailure.serverError error',
      () async {
        final expectedResult = RemoteApiFailure.serverError();
        when(mockApiClient.createAccount(any)).thenThrow(
          expectedResult,
        );

        final result = await repository.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          isA<Outcome<AccountApplicationFeedback>>().having(
            (value) => value.error,
            'value.error',
            equals(expectedResult),
          ),
        );
      },
    );
  });
}