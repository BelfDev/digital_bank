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
    this.themeMode = ThemeMode.light,
  });

  final AppWrapper wrapper;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Locale locale;
  final Iterable<Locale> supportedLocales;

  factory AppTestConfig.defaultConfig({AppWrapper? wrapper}) => AppTestConfig(
        wrapper: wrapper ?? (widget) => widget,
        theme: DSTheme.light().data,
        darkTheme: DSTheme.dark().data,
        locale: Locale('en'),
        supportedLocales: FlowBankLocalizationsDelegate.supportedLocales,
      );
}
