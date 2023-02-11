import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../application_feedback/controller/application_feedback_page_controller.dart';
import '../application_form/controller/application_form_page_controller.dart';

enum Params {
  accountNumberCode('account-number');

  const Params(this.query);

  final String query;
}

final GoRoute accountApplicationRoute = GoRoute(
  path: 'account-application',
  builder: (BuildContext context, GoRouterState state) {
    return const ApplicationFormPageController();
  },
  routes: <RouteBase>[
    GoRoute(
        path: 'feedback/:${Params.accountNumberCode}',
        pageBuilder: (context, state) {
          final code = state.params[Params.accountNumberCode];
          assert(
            code != null,
            'must provide ${Params.accountNumberCode} param',
          );
          return MaterialPage(
            fullscreenDialog: true,
            child: ApplicationFeedbackPageController(
              accountNumberCode: code!,
            ),
          );
        }),
  ],
);
