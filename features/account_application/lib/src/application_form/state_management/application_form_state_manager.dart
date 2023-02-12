import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:data_access/data_access.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application_form_page_state.dart';

typedef ValidateFormCallback = bool Function();

final _stateManagerProvider = StateNotifierProvider.autoDispose<
    ApplicationFormStateManager, ApplicationFormPageState>((ref) {
  return ApplicationFormStateManager(
    ApplicationFormPageState.initial(),
    ref,
  );
});

class ApplicationFormStateManager
    extends StateNotifier<ApplicationFormPageState> {
  ApplicationFormStateManager(
    super.state,
    this._ref,
  );

  final Ref _ref;

  AccountRepositoryProtocol get _accountRepository =>
      _ref.read(AccountRepository.provider);

  static AutoDisposeStateNotifierProvider<ApplicationFormStateManager,
      ApplicationFormPageState> provider = _stateManagerProvider;

  Future<void> submitForm(ValidateFormCallback validate) async {
    final isValid = validate();
    if (isValid != true) {
      return;
    }

    if (state.formData.photoBase64Encoded == null) {
      state = state.copyWith(
        errorFeedback: ErrorFeedbackType.missingPhotoInput,
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      errorFeedback: ErrorFeedbackType.none,
    );

    final outcome = await _accountRepository.createAccount(
      state.formData.toAccountApplication(),
    );

    outcome.fold(
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorFeedback: error.errorFeedbackType,
        );
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          accountNumber: data.accountNumber,
          errorFeedback: ErrorFeedbackType.none,
        );
      },
    );
  }
}
