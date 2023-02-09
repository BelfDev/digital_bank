import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:equatable/equatable.dart';

class ApplicationFormData extends Equatable {
  const ApplicationFormData({
    required this.dependents,
    this.firstName,
    this.lastName,
    this.photo,
    this.birthDate,
    this.gender,
  });

  final String? firstName;
  final String? lastName;
  final String? photo;
  final DateTime? birthDate;
  final GenderOption? gender;
  final List<String> dependents;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        photo,
        birthDate,
        gender,
        dependents,
      ];
}

extension ApplicationFormDataStubs on ApplicationFormData {
  static ApplicationFormData get defaultStub {
    return ApplicationFormData(
      firstName: 'John',
      lastName: 'Doe',
      birthDate: DateTime.now().toUtc(),
      gender: GenderOption.other,
      photo: '<Base64 encoded photo taken in the page>',
      dependents: [
        "Maggie Doe",
        "William Doe",
        "John Doe Jr.",
      ],
    );
  }
}
