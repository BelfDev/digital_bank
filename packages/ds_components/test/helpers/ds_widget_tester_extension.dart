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

  /// Ensures that the images for all [Image], [FadeInImage], and [DecoratedBox]
  /// widgets are loaded.
  Future<void> precacheImages({
    bool pumpAndSettle = false,
    int? pumpNTimes,
    Duration? pumpDuration,
  }) async {
    await runAsync(() async {
      final images = <Future<void>>[];
      for (final element in find.byType(Image).evaluate()) {
        final widget = element.widget as Image;
        final image = widget.image;
        images.add(precacheImage(image, element));
      }
      for (final element in find.byType(FadeInImage).evaluate()) {
        final widget = element.widget as FadeInImage;
        final image = widget.image;
        images.add(precacheImage(image, element));
      }
      for (final element in find.byType(DecoratedBox).evaluate()) {
        final widget = element.widget as DecoratedBox;
        final decoration = widget.decoration;
        if (decoration is BoxDecoration && decoration.image != null) {
          final image = decoration.image!.image;
          images.add(precacheImage(image, element));
        }
      }
      await Future.wait(images);
    });

    if (pumpAndSettle) {
      await this.pumpAndSettle();
    }

    if (pumpNTimes != null || pumpDuration != null) {
      await this.pumpNTimes(pumpNTimes ?? 1, pumpDuration);
    }
  }

  /// Pumps the widget tree [n] times.
  Future<void> pumpNTimes(int n, [Duration? duration]) async {
    for (var i = 0; i < n; i++) {
      await pump(duration);
    }
  }
}
