import 'package:account_application/account_application.dart';
import 'package:go_router/go_router.dart';
import 'package:welcome/welcome.dart';

final GoRouter rootRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) {
        return const WelcomePageController();
      },
      routes: <RouteBase>[
        accountApplicationRoute,
      ],
    ),
  ],
);
