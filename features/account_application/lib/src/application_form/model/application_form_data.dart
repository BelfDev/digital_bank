import 'dart:convert';
import 'dart:io';

import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:data_access/data_access.dart';
import 'package:equatable/equatable.dart';

import 'form_validator_use_case.dart';

class ApplicationFormData with EquatableMixin {
  ApplicationFormData({
    required this.dependents,
    required this.validator,
    this.firstName,
    this.lastName,
    this.photoBase64Encoded,
    this.birthDate,
    this.gender,
  });

  final FormValidatorUseCase validator;
  String? firstName;
  String? lastName;
  String? photoBase64Encoded;
  DateTime? birthDate;
  GenderOption? gender;
  List<String> dependents;

  String? _photoPath;

  String? get photoPath => _photoPath;

  set photoPath(String? filePath) {
    _photoPath = filePath;
    if (filePath != null) {
      File(filePath).readAsBytes().then((value) {
        photoBase64Encoded = base64Encode(value);
      });
    }
  }

  @override
  List<Object?> get props => [
        dependents,
        validator,
        firstName,
        lastName,
        photoPath,
        photoBase64Encoded,
        birthDate,
        gender,
      ];
}

extension AccountApplicationAdapter on ApplicationFormData {
  AccountApplication toAccountApplication() {
    return AccountApplication(
      firstName: firstName!.trim(),
      lastName: lastName!.trim(),
      birthDate: birthDate!.toUtc().toIso8601String(),
      gender: gender!.name,
      photo: photoBase64Encoded!,
      dependents: dependents,
    );
  }
}

extension ApplicationFormDataStubs on ApplicationFormData {
  static ApplicationFormData get defaultStub {
    return ApplicationFormData(
      validator: const FormValidatorUseCase(),
      dependents: [
        "Maggie Doe",
        "William Doe",
        "John Doe Jr.",
      ],
      firstName: 'John',
      lastName: 'Doe',
      birthDate: DateTime.now().toUtc(),
      gender: GenderOption.other,
      photoBase64Encoded: '<Base64 encoded photo taken in the page>',
    );
  }
}
