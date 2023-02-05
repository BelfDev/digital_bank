import 'package:meta/meta.dart';

@immutable
class AccountCreationInput {
  const AccountCreationInput({
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
}
