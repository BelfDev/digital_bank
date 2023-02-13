import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  Future<void> pumpPageWithProviderScope(
    Widget page, {
    required WidgetTestConfig config,
    required List<Override> overrides,
  }) async {
    assert(
      config.appTestConfig != null,
      'Must provide AppTestConfig to pump page widgets',
    );

    await pumpPage(
      _withProviderOverrides(
        overrides: overrides,
        child: page,
      ),
      config: config,
    );
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

  static Widget _withProviderOverrides({
    required List<Override> overrides,
    required Widget child,
  }) {
    return ProviderScope(
      overrides: overrides,
      child: child,
    );
  }
}
