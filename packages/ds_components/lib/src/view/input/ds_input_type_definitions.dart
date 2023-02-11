import 'package:flutter/widgets.dart';

typedef DSFormFieldValidator<T> = String? Function(
  BuildContext context,
  T? value,
);
