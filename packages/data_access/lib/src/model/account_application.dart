import 'package:meta/meta.dart';

@immutable
class AccountApplication {
  const AccountApplication({
    required this.requestType,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.dependents,
  });

  final String requestType;
  final String firstName;
  final String lastName;
  final String photo;
  final List<String> dependents;

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType,
      'firstName': firstName,
      'lastName': lastName,
      'photo': photo,
      'dependents': dependents,
    };
  }
}

extension AccountApplicationStubs on AccountApplication {
  static AccountApplication get defaultStub {
    return AccountApplication(
      requestType: 'new_account',
      firstName: 'John',
      lastName: 'Doe',
      photo: '<Base64 encoded photo taken in the page>',
      dependents: [
        "Maggie Doe",
        "William Doe",
        "John Doe Jr.",
      ],
    );
  }
}
