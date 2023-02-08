import 'package:ds_components/ds_components.dart';

enum GenderOption implements DSDropdownOption {
  male('Male'),
  female('Female'),
  other('Other');

  const GenderOption(this.displayName);

  @override
  final String displayName;
}
