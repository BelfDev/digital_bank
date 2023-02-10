import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

@immutable
class FormValidatorUserCase {
  const FormValidatorUserCase();

  String? validateNameInput(String? value) {
    if (value?.isEmpty ?? true) {
      return _Strings.emptyValueFeedback;
    }
    return null;
  }

  String? validateBirthDateInput(String? value) {
    if (value?.isEmpty ?? true) {
      return _Strings.emptyValueFeedback;
    }

    try {
      DateFormat.yMd().parse(value!);
    } catch (_) {
      return _Strings.invalidFeedback;
    }
    return null;
  }

  String? validateGenderInput(GenderOption? value) {
    if (value == null) {
      return _Strings.emptyValueFeedback;
    }
    return null;
  }
}

class _Strings {
  static const emptyValueFeedback = 'value cannot be empty';
  static const invalidFeedback = 'invalid date';
}
