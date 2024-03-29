import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

@immutable
class FormValidatorUseCase {
  const FormValidatorUseCase();

  String? validateNameInput(BuildContext context, String? value) {
    if (value?.trim().isEmpty ?? true) {
      return context.l10n.validationFeedbackEmptyValue;
    } else if (value!.length > 200) {
      return context.l10n.validationFeedbackInputLength;
    }

    return null;
  }

  String? validateBirthDateInput(BuildContext context, String? value) {
    if (value?.trim().isEmpty ?? true) {
      return context.l10n.validationFeedbackEmptyValue;
    }

    try {
      final date = DateFormat.yMd().parse(value!);
      if (date.isAfter(DateTime.now())) {
        return context.l10n.validationFeedbackInvalidDate;
      }
    } catch (_) {
      return context.l10n.validationFeedbackInvalidDate;
    }
    return null;
  }

  String? validateGenderInput(BuildContext context, GenderOption? value) {
    if (value == null) {
      return context.l10n.validationFeedbackEmptyValue;
    }
    return null;
  }
}
