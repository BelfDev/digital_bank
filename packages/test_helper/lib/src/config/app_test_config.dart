import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

typedef AppWrapper = Widget Function(Widget materialApp);

@immutable
class AppTestConfig {
  const AppTestConfig({
    required this.wrapper,
    required this.theme,
    required this.darkTheme,
    required this.locale,
    required this.supportedLocales,
    required this.localizationsDelegates,
    required this.routerConfig,
    this.themeMode = ThemeMode.light,
  });

  final AppWrapper wrapper;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Locale locale;
  final Iterable<Locale> supportedLocales;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final RouterConfig<Object>? routerConfig;

  factory AppTestConfig.defaultConfig({
    AppWrapper? wrapper,
    RouterConfig<Object>? routerConfig,
  }) =>
      AppTestConfig(
        wrapper: wrapper ?? (widget) => widget,
        theme: DSTheme.light().data,
        darkTheme: DSTheme.dark().data,
        locale: Locale('en'),
        localizationsDelegates: FlowBankLocalizationsDelegate.globalDelegates,
        supportedLocales: FlowBankLocalizationsDelegate.supportedLocales,
        routerConfig: routerConfig,
      );
}
