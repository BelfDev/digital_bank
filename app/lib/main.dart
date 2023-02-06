import 'package:configs/configs.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:welcome/welcome.dart';

void main() {
  Environment.production.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DSTheme.light().data,
      darkTheme: DSTheme.dark().data,
      home: const WelcomePage(),
    );
  }
}
