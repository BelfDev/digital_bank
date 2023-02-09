import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application_form_page_state.dart';

class ApplicationFormStateManager
    extends StateNotifier<ApplicationFormPageState> {
  ApplicationFormStateManager(super.state);

  static AutoDisposeStateNotifierProvider<ApplicationFormStateManager,
          ApplicationFormPageState> provider =
      StateNotifierProvider.autoDispose((ref) {
    return ApplicationFormStateManager(
      ApplicationFormPageState.initial(),
    );
  });

  void submitForm() {
    final isValid = state.formKey.currentState?.validate();
    if (isValid == true) {
      print('First Name: ${state.formData.firstName}');
      print('Last Name: ${state.formData.lastName}');
      print('Date of Birth: ${state.formData.birthDate}');
      print('Gender: ${state.formData.gender}');
      print('Dependents: ${state.formData.dependents}');
    }

    print('submit-form');
  }
}
