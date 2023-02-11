import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/localization.dart';

import 'navigation/router.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {

    // final x = L10n.of(context);

    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: rootRouter,
        title: 'Digital Bank',
        // onGenerateTitle: (context) => L10n.of(context),
        theme: DSTheme.light().data,
        darkTheme: DSTheme.dark().data,
        localizationsDelegates: FlowBankLocalizationsDelegate.globalDelegates,
        supportedLocales: FlowBankLocalizationsDelegate.supportedLocales,
      ),
    );
  }
}
