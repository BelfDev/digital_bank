import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:equatable/equatable.dart';

import 'form_validator_use_case.dart';

class ApplicationFormData with EquatableMixin {
  ApplicationFormData({
    required this.dependents,
    required this.validator,
    this.firstName,
    this.lastName,
    this.photo,
    this.birthDate,
    this.gender,
  });

  final FormValidatorUserCase validator;
  String? firstName;
  String? lastName;
  String? photo;
  DateTime? birthDate;
  GenderOption? gender;
  List<String> dependents;

  @override
  List<Object?> get props => [
        dependents,
        validator,
        firstName,
        lastName,
        photo,
        birthDate,
        gender,
      ];
}

extension ApplicationFormDataStubs on ApplicationFormData {
  static ApplicationFormData get defaultStub {
    return ApplicationFormData(
      validator: const FormValidatorUserCase(),
      dependents: [
        "Maggie Doe",
        "William Doe",
        "John Doe Jr.",
      ],
      firstName: 'John',
      lastName: 'Doe',
      birthDate: DateTime.now().toUtc(),
      gender: GenderOption.other,
      photo: '<Base64 encoded photo taken in the page>',
    );
  }
}
