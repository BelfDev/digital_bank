import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:data_access/data_access.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/localization.dart';

import '../state_management/application_form_page_state.dart';

class ApplicationFormPageController extends StatelessWidget {
  const ApplicationFormPageController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final stateManager = ApplicationFormStateManager.provider;
        ref.listen(
          stateManager,
          (previous, next) => _onNewState(context, previous, next),
        );

        final state = ref.watch(stateManager);

        return ApplicationFormPage(
          state: state,
          onSubmit: ref.read(stateManager.notifier).submitForm,
        );
      },
    );
  }

  Future<void> _onNewState(
    BuildContext context,
    ApplicationFormPageState? previous,
    ApplicationFormPageState next,
  ) async {
    if (!next.isLoading) {
      LoadingOverlay.dismiss(context);
    } else if (next.isLoading) {
      LoadingOverlay.present(context);
    }

    if (next.hasError) {
      DSErrorFeedbackSnackBar.present(
        context,
        errorFeedback: next.errorFeedback!.translate(context),
      );
    }

    if (next.accountNumber != null) {
      context.go('/account-application/feedback/${next.accountNumber}');
    }
  }
}

extension _LocalizedErrorFeedback on ErrorFeedbackType {
  String translate(BuildContext context) {
    final l10n = L10n.of(context);
    switch (this) {
      case ErrorFeedbackType.missingPhotoInput:
        return l10n.applicationFormMissingPhotoInputFeedback;
      case ErrorFeedbackType.clientError:
        return l10n.applicationFormClientApiErrorFeedback;
      case ErrorFeedbackType.serverError:
        return l10n.applicationFormServerApiErrorFeedback;
      case ErrorFeedbackType.generic:
        return l10n.applicationFormGenericApiErrorFeedback;
      case ErrorFeedbackType.none:
        return '';
    }
  }
}
