import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:flutter/foundation.dart';

@immutable
class FormValidatorUserCase {
  const FormValidatorUserCase();

  String? validateNameInput(String? value) {
    if (value?.isEmpty ?? true) {
      return 'value cannot be empty';
    }
    return null;
  }

  String? validateBirthDateInput(String? value) {
    if (value?.isEmpty ?? true) {
      return 'value cannot be empty';
    }
    return null;
  }

  String? validateGenderInput(GenderOption? value) {
    if (value == null) {
      return 'value cannot be empty';
    }
    return null;
  }
}
