import 'package:configs/configs.dart';
import 'package:digital_bank/app_root.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: DSColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: DSColors.gray,
    ),
  );

  Environment.production.init();
  runApp(const AppRoot());
}
