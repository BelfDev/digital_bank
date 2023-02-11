import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../application_feedback/controller/application_feedback_page_controller.dart';
import '../application_form/controller/application_form_page_controller.dart';

final GoRoute accountApplicationRoute = GoRoute(
  path: 'account-application',
  builder: (BuildContext context, GoRouterState state) {
    return const ApplicationFormPageController();
  },
  routes: <RouteBase>[
    GoRoute(
      path: 'feedback',
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: ApplicationFeedbackPageController(),
      ),
    ),
  ],
);
