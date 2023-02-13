import 'package:digital_bank/app_root.dart';
import 'package:digital_bank/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization/localization.dart';

void main() {
  group('AppRoot:', () {
    testWidgets(
      'should configure application root as expected',
      (tester) async {
        await tester.pumpWidget(
          const AppRoot(),
        );

        await tester.pumpAndSettle();

        expect(find.byType(ProviderScope), findsOneWidget);
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is MaterialApp &&
                widget.routerConfig == rootRouter &&
                widget.theme != null &&
                widget.darkTheme != null &&
                widget.localizationsDelegates ==
                    FlowBankLocalizationsDelegate.globalDelegates &&
                widget.supportedLocales ==
                    FlowBankLocalizationsDelegate.supportedLocales,
          ),
          findsOneWidget,
        );
      },
    );
  });
}
