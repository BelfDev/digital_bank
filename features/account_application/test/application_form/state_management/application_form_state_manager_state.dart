import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:account_application/src/application_form/model/form_validator_use_case.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:data_access/data_access.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<AccountRepositoryProtocol>(as: Symbol('MockAccountRepository')),
])
import 'application_form_state_manager_state.mocks.dart';

void main() {
  ApplicationFormStateManager setupStateManager(
    MockAccountRepository mockAccountRepository, {
    ApplicationFormPageState? state,
  }) {
    final container = ProviderContainer(
      overrides: [
        AccountRepository.provider.overrideWith((_) => mockAccountRepository),
        if (state == null)
          ApplicationFormStateManager.provider
        else
          ApplicationFormStateManager.provider.overrideWith(
            (ref) => ApplicationFormStateManager(state, ref),
          ),
      ],
    );

    return container.read(ApplicationFormStateManager.provider.notifier);
  }

  group('ApplicationFormStateManager:', () {
    test('should start with isLoading set to false', () {
      final stateManager = setupStateManager(MockAccountRepository());
      expect(stateManager.debugState.isLoading, isFalse);
    });

    test('should start with errorFeedback set to null', () {
      final stateManager = setupStateManager(MockAccountRepository());
      expect(stateManager.debugState.errorFeedback, isNull);
    });

    test('should start with accountNumber set to null', () {
      final stateManager = setupStateManager(MockAccountRepository());
      expect(stateManager.debugState.accountNumber, isNull);
    });

    test('should start with formData empty', () {
      final stateManager = setupStateManager(MockAccountRepository());
      final expectedFormData = ApplicationFormData(
        validator: const FormValidatorUserCase(),
        dependents: [],
      );

      expect(
        stateManager.debugState.formData,
        equals(expectedFormData),
      );
    });

    test('when formData is invalid should short-circuit operation', () async {
      final stateManager = setupStateManager(MockAccountRepository());
      await stateManager.submitForm(() => false);
      expect(
        stateManager.debugState.errorFeedback,
        isNull,
      );
      expect(
        stateManager.debugState.isLoading,
        isFalse,
      );
    });

    test(
      'when formData is valid but photo is empty should emit state with FeedbackType.missingPhotoInput error',
      () async {
        final stateManager = setupStateManager(MockAccountRepository());
        await stateManager.submitForm(() => true);
        expect(
          stateManager.debugState.errorFeedback,
          equals(ErrorFeedbackType.missingPhotoInput),
        );
      },
    );

    test(
      'when formData is complete and valid should emit data state',
      () async {
        final expectedData = AccountApplicationFeedbackStubs.defaultStub;

        final mockRepo = MockAccountRepository();
        final initialState = ApplicationFormPageState.initial().copyWith(
          formData: ApplicationFormDataStubs.defaultStub,
        );
        final stateManager = setupStateManager(
          mockRepo,
          state: initialState,
        );

        when(mockRepo.createAccount(any)).thenAnswer(
          (_) async => Outcome.success(
            AccountApplicationFeedbackStubs.defaultStub,
          ),
        );

        await stateManager.submitForm(() => true);

        expect(
          stateManager.debugState,
          ApplicationFormPageState(
            isLoading: false,
            accountNumber: expectedData.accountNumber,
            errorFeedback: ErrorFeedbackType.none,
            formData: initialState.formData,
          ),
        );
      },
    );

    test(
      'when formData is complete and valid should emit loading and data states',
      () async {
        final expectedData = AccountApplicationFeedbackStubs.defaultStub;

        final mockRepo = MockAccountRepository();
        final initialState = ApplicationFormPageState.initial().copyWith(
          formData: ApplicationFormDataStubs.defaultStub,
        );
        final stateManager = setupStateManager(
          mockRepo,
          state: initialState,
        );

        when(mockRepo.createAccount(any)).thenAnswer(
          (_) async => Outcome.success(
            AccountApplicationFeedbackStubs.defaultStub,
          ),
        );

        expectLater(
          stateManager.stream,
          emitsInOrder([
            ApplicationFormPageState(
              isLoading: true,
              accountNumber: null,
              errorFeedback: ErrorFeedbackType.none,
              formData: initialState.formData,
            ),
            ApplicationFormPageState(
              isLoading: false,
              accountNumber: expectedData.accountNumber,
              errorFeedback: ErrorFeedbackType.none,
              formData: initialState.formData,
            ),
          ]),
        );

        await stateManager.submitForm(() => true);
      },
    );

    test(
      'when formData is complete but an error occurs should emit loading and error states',
      () async {
        final mockRepo = MockAccountRepository();
        final initialState = ApplicationFormPageState.initial().copyWith(
          formData: ApplicationFormDataStubs.defaultStub,
        );
        final stateManager = setupStateManager(
          mockRepo,
          state: initialState,
        );

        when(mockRepo.createAccount(any)).thenAnswer(
          (_) async => Outcome.failure(
            RemoteApiFailure.serverError(),
          ),
        );

        expectLater(
          stateManager.stream,
          emitsInOrder([
            ApplicationFormPageState(
              isLoading: true,
              accountNumber: null,
              errorFeedback: ErrorFeedbackType.none,
              formData: initialState.formData,
            ),
            ApplicationFormPageState(
              isLoading: false,
              accountNumber: null,
              errorFeedback: ErrorFeedbackType.serverError,
              formData: initialState.formData,
            ),
          ]),
        );

        await stateManager.submitForm(() => true);
      },
    );
  });
}
