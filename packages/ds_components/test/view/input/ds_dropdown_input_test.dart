import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/ds_widget_tester_extension.dart';

enum _TestOptions implements DSDropdownOption {
  option1,
  option2,
  option3;

  const _TestOptions();

  @override
  String translate(BuildContext context) {
    switch (this) {
      case _TestOptions.option1:
        return 'Option 1';
      case _TestOptions.option2:
        return 'Option 2';
      case _TestOptions.option3:
        return 'Option 3';
    }
  }
}

void main() {
  group('DSDropdownInput:', () {
    testWidgets('Renders core widgets and properties', (
      WidgetTester tester,
    ) async {
      const expectedHintText = 'Some hint text';
      const expectedMargin = EdgeInsets.all(16.0);
      const expectedItems = _TestOptions.values;

      await tester.pumpMaterialWidget(
        Material(
          child: DSDropdownInput(
            hintText: expectedHintText,
            margin: expectedMargin,
            items: expectedItems,
          ),
        ),
      );

      expect(
          find.byType(DropdownButtonFormField<_TestOptions>), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is DropdownButtonFormField<_TestOptions>) {
          return widget.decoration.hintText == expectedHintText;
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
