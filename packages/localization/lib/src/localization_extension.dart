import 'package:flutter/widgets.dart';
import 'package:localization/src/l10n/generated/l10n_en.dart';

// Generated with melos gen-l10n
import 'l10n/generated/l10n.dart';

extension L10nContextAccess on BuildContext {
  L10n get l10n => Localizations.of<L10n>(this, L10n) ?? L10nEn();
}
