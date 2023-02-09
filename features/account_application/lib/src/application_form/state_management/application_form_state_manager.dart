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
    state.formKey.currentState?.validate();
    print('submit-form');
  }

}
