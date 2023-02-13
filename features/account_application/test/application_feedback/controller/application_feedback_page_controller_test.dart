import 'package:account_application/src/application_feedback/controller/application_feedback_page_controller.dart';
import 'package:account_application/src/application_feedback/view/application_feedback_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';

void main() {
  const accountNumberCode = '7544939';

  group('ApplicationFeedbackPageController:', () {
    testWidgets(
      "should render ApplicationFeedbackPage",
      (tester) async {
        await tester.pumpPage(
          ApplicationFeedbackPageController(
            accountNumberCode: accountNumberCode,
          ),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();
        expect(find.byType(ApplicationFeedbackPage), findsOneWidget);
      },
    );
  });
}
