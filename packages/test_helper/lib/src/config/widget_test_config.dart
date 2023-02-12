import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_test_config.dart';

@immutable
class WidgetTestConfig {
  const WidgetTestConfig({
    this.duration,
    this.phase = EnginePhase.sendSemanticsUpdate,
    this.appTestConfig,
  });

  final Duration? duration;
  final EnginePhase phase;
  final AppTestConfig? appTestConfig;

  factory WidgetTestConfig.defaultConfig({AppTestConfig? appTestConfig}) =>
      WidgetTestConfig(
        phase: EnginePhase.sendSemanticsUpdate,
        appTestConfig: appTestConfig ?? AppTestConfig.defaultConfig(),
      );
}
