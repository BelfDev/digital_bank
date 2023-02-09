import 'package:account_application/account_application.dart';
import 'package:configs/configs.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: DSTheme.light().data,
        darkTheme: DSTheme.dark().data,
        home: const ApplicationFormPageController(),
      ),
    );
  }
}
