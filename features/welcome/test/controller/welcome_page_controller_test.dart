import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';
import 'package:welcome/src/view/welcome_page.dart';
import 'package:welcome/welcome.dart';

void main() {
  group('WelcomePageController:', () {
    testWidgets(
      "should render WelcomePage",
      (tester) async {
        await tester.pumpPage(
          WelcomePageController(),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();
        expect(find.byType(WelcomePage), findsOneWidget);
      },
    );
  });
}
