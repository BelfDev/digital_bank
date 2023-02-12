import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/ds_widget_tester_extension.dart';

void main() {
  group('DSTextInput:', () {
    testWidgets('Renders core widgets and properties', (
      WidgetTester tester,
    ) async {
      const expectedHintText = 'Some hint text';
      const expectedMargin = EdgeInsets.all(16.0);
      const expectedTextInputAction = TextInputAction.done;
      const expectedReadOnly = false;
      final expectedController =
          TextEditingController(text: 'Some controller text');

      await tester.pumpMaterialWidget(
        Material(
          child: DSTextInput(
            hintText: expectedHintText,
            margin: expectedMargin,
            textInputAction: expectedTextInputAction,
            readOnly: expectedReadOnly,
            controller: expectedController,
          ),
        ),
      );

      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextField) {
          return widget.decoration?.hintText == expectedHintText;
        }
        return false;
      }), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextField) {
          return widget.textInputAction == expectedTextInputAction;
        }
        return false;
      }), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextField) {
          return widget.readOnly == expectedReadOnly;
        }
        return false;
      }), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is TextField) {
          return widget.controller == expectedController;
        }
        return false;
      }), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Container) {
          return widget.margin == expectedMargin &&
              widget.padding == EdgeInsets.only(top: 4.0) &&
              widget.constraints?.maxHeight == DSTheme.inputFieldHeight - 4.0;
        }
        return false;
      }), findsOneWidget);
    });
  });
}
