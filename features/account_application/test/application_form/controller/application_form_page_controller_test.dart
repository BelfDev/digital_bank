import 'package:account_application/src/application_form/controller/application_form_page_controller.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:account_application/src/application_form/state_management/application_form_state_manager.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization/localization.dart';
import 'package:test_helper/test_helper.dart';

void main() {
  group('ApplicationFormPageController:', () {
    testWidgets(
      "when initial state should render ApplicationFormPage",
      (tester) async {
        await tester.pumpPageController(
          state: ApplicationFormPageState.initial(),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(LoadingOverlay), findsNothing);
      },
    );

    testWidgets(
      "when submit with empty fields should display error feedback",
      (tester) async {
        final l10n = await L10n.delegate.load(const Locale('en'));

        await tester.pumpPageController();
        await tester.pumpAndSettle();

        await tester.tap(find.text(
          l10n.applicationFormSubmitApplicationFloatingButton,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(LoadingOverlay), findsNothing);

        expect(
          find.text(l10n.validationFeedbackEmptyValue),
          findsNWidgets(4),
        );
      },
    );

    testWidgets(
      "when submit with complete form data should show loading overlay",
      (tester) async {
        final mockStateManager = _MockApplicationFormStateManager(
          ApplicationFormPageState.initial(),
        );

        await tester.pumpPageController(
          mockStateManager: mockStateManager,
        );
        await tester.pumpAndSettle();

        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(LoadingOverlay), findsNothing);

        // ignore: invalid_use_of_protected_member
        mockStateManager.state = ApplicationFormPageState.initial().copyWith(
          isLoading: true,
        );

        await tester.pump();

        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(LoadingOverlay), findsOneWidget);
      },
    );
  });
}

class _MockApplicationFormStateManager
    extends MockStateNotifier<ApplicationFormPageState>
    implements ApplicationFormStateManager {
  _MockApplicationFormStateManager(super.state);
}

extension _PumpApplicationFormPageController on WidgetTester {
  Future<void> pumpPageController({
    ApplicationFormPageState? state,
    _MockApplicationFormStateManager? mockStateManager,
    List<Override> additionalOverrides = const [],
    AppTestConfig? appTestConfig,
  }) async {
    await pumpPageWithProviderScope(
      const ApplicationFormPageController(),
      overrides: [
        if (state != null)
          ApplicationFormStateManager.provider.overrideWith(
            (_) => _MockApplicationFormStateManager(state),
          )
        else if (mockStateManager != null)
          ApplicationFormStateManager.provider.overrideWith(
            (_) => mockStateManager,
          ),
        ...additionalOverrides,
      ],
      config: WidgetTestConfig.defaultConfig(appTestConfig: appTestConfig),
    );
  }
}
