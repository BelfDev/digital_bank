import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state_management/application_form_page_state.dart';

class ApplicationFormPageController extends StatelessWidget {
  const ApplicationFormPageController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final stateManager = ApplicationFormStateManager.provider;
        final state = ref.watch(stateManager);

        ref.listen(
          stateManager,
          (previous, next) => _onNewState(context, previous, next),
        );

        return ApplicationFormPage(
          state: state,
          onSubmit: ref.read(stateManager.notifier).submitForm,
        );
      },
    );
  }

  void _onNewState(
    BuildContext context,
    ApplicationFormPageState? previous,
    ApplicationFormPageState next,
  ) {
    if (!next.isLoading) {
      LoadingOverlay.dismiss(context);
    } else if (next.isLoading) {
      LoadingOverlay.present(context);
    }

    if (next.hasError) {
      // TODO(BelfDev): Style this.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(next.errorFeedback!),
        ),
      );
    }
  }
}
