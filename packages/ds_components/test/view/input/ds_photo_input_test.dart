import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/ds_widget_tester_extension.dart';

void main() {
  group('DSPhotoInput:', () {
    testWidgets('Renders core widgets and properties', (
      WidgetTester tester,
    ) async {
      const expectedHintText = 'Some hint text';

      await tester.pumpMaterialWidget(Material(
        child: DSPhotoInput(
          hintText: expectedHintText,
        ),
      ));

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
      expect(find.byType(SizedBox), findsNWidgets(2));
      expect(find.byType(Text), findsOneWidget);
      expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);
    });
  });
}
