import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpMaterialWidget(Widget widget) async {
    final tester = this;
    await tester.pumpWidget(
      _withStandardMaterialApp(widget),
    );
  }

  Widget _withStandardMaterialApp(Widget widget) {
    return MaterialApp(
      theme: ThemeData.light(),
      locale: Locale('en'),
      home: widget,
    );
  }
}
