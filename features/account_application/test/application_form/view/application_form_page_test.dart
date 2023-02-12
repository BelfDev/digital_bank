import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';

void main() {
  const channel = MethodChannel('flutter_keyboard_visibility');

  void mockKeyboardVisibility() {
    const dummyInteger = 1;
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      await ServicesBinding.instance.defaultBinaryMessenger
          .handlePlatformMessage(
        'flutter_keyboard_visibility',
        const StandardMethodCodec().encodeSuccessEnvelope(dummyInteger),
        (data) {},
      );
    });
  }

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
        expect(find.bySubtype<DSDropdownInput>(), findsOneWidget);
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
        mockKeyboardVisibility();

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

    testWidgets(
      'when submit button is pressed should trigger callback',
      (tester) async {
        int callbackCounter = 0;
        void onSubmit(bool Function() validate) async {
          callbackCounter++;
        }

        await tester.pumpPage(
          ApplicationFormPage(
            onSubmit: onSubmit,
            state: ApplicationFormPageState.initial(),
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(DSElevatedButton), findsOneWidget);
        await tester.tap(find.byType(DSElevatedButton));

        expect(callbackCounter, equals(1));
      },
    );

    testWidgets(
      'when enter input should update form state',
      (tester) async {
        mockKeyboardVisibility();
        final state = ApplicationFormPageState.initial();

        await tester.pumpPage(
          ApplicationFormPage(
            state: state,
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        // Scroll to the bottom of the page
        final gesture = await tester.startGesture(Offset(0, 300));
        await gesture.moveBy(Offset(0, -1000));
        await tester.pump();

        // Enter value on text input fields
        const baseTextInput = 'Some input';

        final textInputFinder = find.byType(DSTextInput);
        await tester.runAsync(() async {
          for (int i = 0; i < textInputFinder.evaluate().length; i++) {
            await tester.enterText(
                find.byType(DSTextInput).at(i), '$baseTextInput $i');
            await tester.pumpAndSettle();
          }
        });

        // Enter value on date input field
        final dateInputFinder = find.byType(DSDatePickerInput);
        await tester.tap(dateInputFinder);
        await tester.pumpAndSettle();
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();

        // Enter value on gender input field
        final dropdownFinder = find.bySubtype<DSDropdownInput>();
        await tester.tap(dropdownFinder);
        await tester.pumpAndSettle();
        await tester.tap(find.text('Male').last);
        await tester.pumpAndSettle();

        // Enter value on dependent input field
        const dependentName = 'John Doe';
        await tester.tap(find.byType(DSOutlinedButton));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(DSTextInput).last, dependentName);
        await tester.pumpAndSettle();

        // Check if form state is updated
        expect(state.isLoading, isFalse);
        expect(state.accountNumber, isNull);
        expect(state.errorFeedback, isNull);

        final baseDate = DateTime.now();
        final formData = state.formData;
        expect(formData, isNotNull);
        expect(formData.firstName, equals('$baseTextInput 0'));
        expect(formData.lastName, equals('$baseTextInput 1'));
        expect(
          formData.birthDate,
          equals(DateTime(baseDate.year - 18, baseDate.month, baseDate.day)),
        );
        expect(formData.gender, equals(GenderOption.male));
        expect(formData.dependents, equals([dependentName]));
      },
    );
  });
}
