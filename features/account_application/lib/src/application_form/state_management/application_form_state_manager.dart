import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:data_access/data_access.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application_form_page_state.dart';

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
    this.ref,
  );

  final Ref ref;

  AccountRepositoryProtocol get _accountRepository =>
      ref.read(AccountRepository.provider);

  static AutoDisposeStateNotifierProvider<ApplicationFormStateManager,
      ApplicationFormPageState> provider = _stateManagerProvider;

  void submitForm() async {
    final isValid = state.formKey.currentState?.validate();
    if (isValid != true) {
      return;
    }

    if (isValid == true) {
      print('First Name: ${state.formData.firstName}');
      print('Last Name: ${state.formData.lastName}');
      print('Date of Birth: ${state.formData.birthDate}');
      print('Gender: ${state.formData.gender}');
      print('Dependents: ${state.formData.dependents}');
    }

    state = state.copyWith(
      isLoading: true,
    );

    final outcome = await _accountRepository.createAccount(
      state.formData.toAccountApplication(),
    );

    outcome.fold(
      (error) {
        state = state.copyWith(
          isLoading: false,
          errorFeedback: error.toString(),
        );
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          accountNumber: data.accountNumber,
          errorFeedback: '',
        );
      },
    );
  }
}
