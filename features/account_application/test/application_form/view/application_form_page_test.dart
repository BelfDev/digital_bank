import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';

void main() {
  const channel = MethodChannel('flutter_keyboard_visibility');

  setUp(() async {
    const dummyInteger = 1;
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(
        'flutter_keyboard_visibility',
        const StandardMethodCodec().encodeSuccessEnvelope(dummyInteger),
        (data) {},
      );
    });
  });

  group('ApplicationFormPage:', () {
    testWidgets(
      'when initial state should render all core widgets and properties',
      (tester) async {
        await tester.pumpPage(
          ApplicationFormPage(
            state: ApplicationFormPageState.initial(),
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(DSFormScaffold), findsOneWidget);
        expect(find.bySubtype<DSAppBar>(), findsOneWidget);
        expect(find.byType(DSBackButton), findsOneWidget);
        expect(find.byType(DSFormSection), findsNWidgets(2));
        expect(find.byType(DSPhotoInput), findsOneWidget);
        expect(find.byType(DSTextInput), findsNWidgets(3));
        expect(find.byType(DSDatePickerInput), findsOneWidget);
        expect(find.byType(AnimatedList), findsOneWidget);
        expect(find.byType(DSOutlinedButton), findsOneWidget);
        expect(find.byType(DSElevatedButton), findsOneWidget);
        expect(find.byType(SizedBox), findsNWidgets(16));
      },
    );

    testWidgets(
      'when loading state should disable the submit button',
      (tester) async {
        await tester.pumpPage(
          ApplicationFormPage(
            state: ApplicationFormPageState.initial().copyWith(
              isLoading: true,
            ),
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ApplicationFormPage), findsOneWidget);
        expect(find.byType(DSFormScaffold), findsOneWidget);
        expect(find.bySubtype<DSAppBar>(), findsOneWidget);
        expect(find.byType(DSBackButton), findsOneWidget);
        expect(find.byType(DSFormSection), findsNWidgets(2));
        expect(find.byType(DSPhotoInput), findsOneWidget);
        expect(find.byType(DSTextInput), findsNWidgets(3));
        expect(find.byType(DSDatePickerInput), findsOneWidget);
        expect(find.byType(AnimatedList), findsOneWidget);
        expect(find.byType(DSOutlinedButton), findsOneWidget);
        expect(find.byType(DSElevatedButton), findsOneWidget);
        expect(find.byType(SizedBox), findsNWidgets(16));

        expect(find.byWidgetPredicate((widget) {
          if (widget is DSElevatedButton) {
            return widget.enabled == false;
          }
          return false;
        }), findsOneWidget);
      },
    );

    testWidgets(
      'when add dependent is pressed then should spawn a new DSTextInput',
      (tester) async {
        await tester.pumpPage(
          ApplicationFormPage(
            state: ApplicationFormPageState.initial(),
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        // Initial state
        expect(find.byType(DSOutlinedButton), findsOneWidget);
        expect(find.byType(DSTextInput), findsNWidgets(3));
        expect(find.byType(AnimatedList), findsOneWidget);
        expect(find.byType(SizedBox), findsNWidgets(16));

        // Scroll to the bottom of the page
        final gesture = await tester.startGesture(Offset(0, 300));
        await gesture.moveBy(Offset(0, -1000));
        await tester.pump();

        // Add a new dependent
        expect(find.byType(DSOutlinedButton), findsOneWidget);
        await tester.tap(find.byType(DSOutlinedButton));
        await tester.pumpAndSettle();

        expect(find.byType(DSTextInput), findsNWidgets(4));

        // Add a second new dependent
        await tester.tap(find.byType(DSOutlinedButton));
        await tester.pumpAndSettle();

        expect(find.byType(DSTextInput), findsNWidgets(5));
      },
    );

    testWidgets(
      'when remove dependent field when remove button is pressed',
      (tester) async {
        await tester.pumpPage(
          ApplicationFormPage(
            state: ApplicationFormPageState.initial(),
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        // Initial state
        expect(find.byType(DSOutlinedButton), findsOneWidget);
        expect(find.byType(DSTextInput), findsNWidgets(3));
        expect(find.byType(AnimatedList), findsOneWidget);
        expect(find.byType(SizedBox), findsNWidgets(17));

        // Scroll to the bottom of the page
        final gesture = await tester.startGesture(Offset(0, 300));
        await gesture.moveBy(Offset(0, -1000));
        await tester.pump();

        // Add a new dependent
        const baseDependentName = 'John Doe';
        await tester.runAsync(() async {
          for (int i = 0; i < 3; i++) {
            await tester.tap(find.byType(DSOutlinedButton));
            await tester.pumpAndSettle();
            await tester.enterText(
                find.byType(DSTextInput).last, '$baseDependentName $i');
            await tester.pumpAndSettle();
          }
        });

        expect(find.byType(DSTextInput), findsNWidgets(6));
        expect(find.text('$baseDependentName 0'), findsOneWidget);
        expect(find.text('$baseDependentName 1'), findsOneWidget);
        expect(find.text('$baseDependentName 2'), findsOneWidget);

        // Remove a dependent
        await tester.tap(find.byIcon(Icons.delete_forever).first);
        await tester.pumpAndSettle();

        // DSDecisionBottomSheet should be visible
        expect(find.byType(DSDecisionBottomSheet), findsOneWidget);
        await tester.tap(find.text('remove'));
        await tester.pumpAndSettle();

        // Dependent should be removed
        expect(find.byType(DSTextInput), findsNWidgets(5));
        expect(find.text('$baseDependentName 0'), findsNothing);
        expect(find.text('$baseDependentName 1'), findsOneWidget);
        expect(find.text('$baseDependentName 2'), findsOneWidget);
        expect(find.text('$baseDependentName 4'), findsNothing);
      },
    );
  });
}
