import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_helper.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> pumpMaterialWidget(
    Widget widget, {
    WidgetTestConfig? config,
  }) async {
    final tester = this;
    await tester.pumpWidget(widget);
  }

  Future<void> pumpPage(
    Widget page, {
    required WidgetTestConfig config,
  }) async {
    assert(
      config.appTestConfig != null,
      'Must provide AppTestConfig to pump page widgets',
    );
    await binding.setSurfaceSize(Size(750.0, 1334.0));
    binding.window.devicePixelRatioTestValue = 1.0;

    await pumpWidget(
      _withAppConfig(page, config.appTestConfig!),
      config.duration,
      config.phase,
    );

    addTearDown(binding.window.clearPhysicalSizeTestValue);
  }

  Widget _withAppConfig(Widget widget, AppTestConfig appTestConfig) {
    if (appTestConfig.routerConfig != null) {
      return MaterialApp.router(
        themeMode: appTestConfig.themeMode,
        theme: appTestConfig.theme,
        darkTheme: appTestConfig.darkTheme,
        locale: appTestConfig.locale,
        supportedLocales: appTestConfig.supportedLocales,
        localizationsDelegates: appTestConfig.localizationsDelegates,
        routerConfig: appTestConfig.routerConfig!,
      );
    }

    return MaterialApp(
      themeMode: appTestConfig.themeMode,
      theme: appTestConfig.theme,
      darkTheme: appTestConfig.darkTheme,
      home: appTestConfig.wrapper(widget),
      locale: appTestConfig.locale,
      supportedLocales: appTestConfig.supportedLocales,
      localizationsDelegates: appTestConfig.localizationsDelegates,
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
