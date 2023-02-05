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
}
