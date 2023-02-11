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
      path: ':id/feedback',
      pageBuilder: (context, state) {
        final accountNumberCode = state.params['id'];
        assert(
          accountNumberCode != null,
          'must provide the id parameter for the account-application/:id/feedback route',
        );
        return MaterialPage(
          fullscreenDialog: true,
          child: ApplicationFeedbackPageController(
            accountNumberCode: accountNumberCode!,
          ),
        );
      },
    ),
  ],
);
