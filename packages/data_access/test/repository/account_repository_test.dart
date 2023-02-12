import 'package:data_access/src/model/public_models.dart';
import 'package:data_access/src/repository/account_repository.dart';
import 'package:data_access/src/service/api_client/flow_bank_api_client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

        verify(mockApiClient.createAccount(any)).called(1);
        verifyNoMoreInteractions(mockApiClient);
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

        verify(mockApiClient.createAccount(any)).called(1);
        verifyNoMoreInteractions(mockApiClient);
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

        verify(mockApiClient.createAccount(any)).called(1);
        verifyNoMoreInteractions(mockApiClient);
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

        verify(mockApiClient.createAccount(any)).called(1);
        verifyNoMoreInteractions(mockApiClient);
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

        verify(mockApiClient.createAccount(any)).called(1);
        verifyNoMoreInteractions(mockApiClient);
      },
    );

    test(
      'should provide an Provider<AccountRepository>',
      () async {
        final provider = AccountRepository.provider;

        expect(
          provider,
          isA<Provider<AccountRepository>>(),
        );
      },
    );
  });
}
