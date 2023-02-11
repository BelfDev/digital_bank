import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:welcome/src/view/welcome_page.dart';

class WelcomePageController extends StatelessWidget {
  const WelcomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomePage(
      onFloatingButtonPressed: () => context.go('/account-application'),
    );
  }
}
