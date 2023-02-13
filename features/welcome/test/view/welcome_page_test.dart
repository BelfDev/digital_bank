import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_helper/test_helper.dart';
import 'package:welcome/src/view/welcome_page.dart';

void main() {
  group('WelcomePage:', () {
    testWidgets(
      'should render all core widgets and properties',
      (tester) async {
        await tester.pumpPage(
          WelcomePage(),
          config: WidgetTestConfig.defaultConfig(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(WelcomePage), findsOneWidget);
        expect(find.byType(DSArtworkScaffold), findsOneWidget);
        expect(find.bySubtype<DSAppBar>(), findsNothing);
        expect(find.byType(DSCloseButton), findsNothing);
        expect(find.byType(Padding), findsNWidgets(5));
        expect(
          find.byWidgetPredicate((widget) => widget is RichText),
          findsNWidgets(2),
        );
        expect(find.byType(Text), findsOneWidget);
        expect(find.byType(DSElevatedButton), findsOneWidget);
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      },
    );
  });
}
