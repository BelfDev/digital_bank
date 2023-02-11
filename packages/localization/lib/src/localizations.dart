// Generated with melos boostrap or flutter pub get
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  const L10n._();

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
}

extension L10nContextAccess on BuildContext {
  AppLocalizations? get l10n {
    return L10n.of(this);
  }
}
