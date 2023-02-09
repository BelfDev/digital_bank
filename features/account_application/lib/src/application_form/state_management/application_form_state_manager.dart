import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'application_form_state.dart';

final applicationFormProvider = StateNotifierProvider.autoDispose(
  (ref) => ApplicationFormStateManager(
    ApplicationFormState.initial(),
  ),
);

class ApplicationFormStateManager extends StateNotifier<ApplicationFormState> {
  ApplicationFormStateManager(super.state);

  void submitSubmit() {
    print('submit-form');
  }
}
