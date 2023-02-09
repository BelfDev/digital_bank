import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationFormPageController extends StatelessWidget {
  const ApplicationFormPageController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        WidgetRef ref,
        Widget? child,
      ) {
        final provider = ApplicationFormStateManager.provider;
        final state = ref.watch(provider);
        if (state.isLoading) {
          return CircularProgressIndicator();
        }

        return ApplicationFormPage(
          state: state,
          onSubmit: ref.read(provider.notifier).submitForm,
        );
      },
    );
  }
}
