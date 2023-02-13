import 'package:account_application/src/application_feedback/view/application_feedback_page.dart';
import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:account_application/src/application_form/view/application_form_page.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';

void main() {

  const accountNumberCode = '7544939';

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('ApplicationFeedbackPage:', () {
    testWidgets(
      'should render all core widgets and properties',
          (tester) async {

        await tester.precacheImages();
        await tester.pumpPage(
          ApplicationFeedbackPage(
            accountNumberCode: accountNumberCode,
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ApplicationFeedbackPage), findsOneWidget);
        expect(find.byType(DSArtworkScaffold), findsOneWidget);
        expect(find.bySubtype<DSAppBar>(), findsOneWidget);
        expect(find.byType(DSCloseButton), findsOneWidget);
        expect(find.byType(Column), findsNWidgets(2));
        expect(find.byType(Text), findsNWidgets(6));
        expect(find.byType(DSCodeContainer), findsOneWidget);
        expect(find.byType(DSElevatedButton), findsOneWidget);
      },
    );
  });
}
