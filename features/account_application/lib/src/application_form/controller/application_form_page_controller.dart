import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationFormPageController extends StatelessWidget {
  const ApplicationFormPageController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final stateManager = ApplicationFormStateManager.provider;
        ref.listen(
          stateManager,
          (previousState, currentState) {
            if (currentState.isLoading) {
              // TODO(BelfDev): Show loading overlay
            } else if (currentState.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(currentState.errorFeedback!),
                ),
              );
            }
          },
        );

        final state = ref.watch(stateManager);
        return ApplicationFormPage(
          state: state,
          onSubmit: ref.read(stateManager.notifier).submitForm,
        );
      },
    );
  }
}
