import 'package:ds_components/ds_components.dart';
import 'package:flutter/widgets.dart';
import 'package:localization/localization.dart';

enum GenderOption implements DSDropdownOption {
  male,
  female,
  other;

  @override
  String translate(BuildContext context) {
    final l10n = L10n.of(context);
    switch (this) {
      case GenderOption.male:
        return l10n.genderOptionMale;
      case GenderOption.female:
        return l10n.genderOptionFemale;
      case GenderOption.other:
        return l10n.genderOptionOther;
    }
  }
}
