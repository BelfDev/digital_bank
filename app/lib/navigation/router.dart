import 'package:account_application/account_application.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:welcome/welcome.dart';

final GoRouter rootRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePageController();
      },
      routes: <RouteBase>[
        accountApplicationRoute,
      ],
    ),
  ],
);
