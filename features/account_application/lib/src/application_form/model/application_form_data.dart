import 'package:account_application/src/application_form/model/gender_option.dart';

class ApplicationFormData {
  const ApplicationFormData({
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.birthDate,
    required this.gender,
    required this.dependents,
  });

  final String firstName;
  final String lastName;
  final String photo;
  final DateTime birthDate;
  final GenderOption gender;
  final List<String> dependents;
}

extension AccountApplicationStubs on ApplicationFormData {
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
