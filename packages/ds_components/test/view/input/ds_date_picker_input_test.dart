import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/ds_widget_tester_extension.dart';

void main() {
  group('DSDatePickerInput:', () {
    testWidgets('Renders core widgets and properties', (
      WidgetTester tester,
    ) async {
      const expectedHintText = 'Some hint text';
      const expectedMargin = EdgeInsets.all(16.0);

      await tester.pumpMaterialWidget(Material(
        child: DSDatePickerInput(
          hintText: expectedHintText,
          margin: expectedMargin,
          onDateSelected: null,
        ),
      ));

      expect(find.byType(DSTextInput), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextField) {
          return widget.decoration?.hintText == expectedHintText;
        }
        return false;
      }), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Container) {
          return widget.margin == expectedMargin &&
              widget.constraints?.maxHeight == DSTheme.inputFieldHeight;
        }
        return false;
      }), findsOneWidget);
    });
  });
}
