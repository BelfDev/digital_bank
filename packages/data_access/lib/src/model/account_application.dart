import 'package:meta/meta.dart';

@immutable
class AccountApplication {
  const AccountApplication({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    required this.photo,
    required this.dependents,
    this.requestType = 'new_account',
  });

  final String firstName;
  final String lastName;
  final String birthDate;
  final String gender;
  final String photo;
  final List<String> dependents;
  final String requestType;

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate,
      'gender': gender,
      'photo': photo,
      'dependents': dependents,
      'requestType': requestType,
    };
  }
}

extension AccountApplicationStubs on AccountApplication {
  static AccountApplication get defaultStub {
    return AccountApplication(
      requestType: 'new_account',
      firstName: 'John',
      lastName: 'Doe',
      birthDate: '2001-03-25 00:00:00',
      gender: 'other',
      photo: '<Base64 encoded photo taken in the page>',
      dependents: [
        "Maggie Doe",
        "William Doe",
        "John Doe Jr.",
      ],
    );
  }
}
