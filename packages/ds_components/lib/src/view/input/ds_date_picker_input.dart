import 'package:ds_components/src/theme/public_themes.dart';
import 'package:flutter/material.dart';

class DSDatePickerInput extends StatelessWidget {
  const DSDatePickerInput({
    super.key,
    required this.hintText,
    this.margin,
    this.errorFormatText,
    this.errorInvalidText,
    this.onDateSaved,
  });

  final String hintText;

  final EdgeInsetsGeometry? margin;

  /// The error text displayed if the entered date is not in the correct format.
  final String? errorFormatText;

  /// The error text displayed if the date is not valid.
  final String? errorInvalidText;

  /// An optional method to call with the final date when the form is
  /// saved via [FormState.save].
  final ValueChanged<DateTime>? onDateSaved;

  @override
  Widget build(BuildContext context) {
    final baseDate = DateTime.now();
    return Container(
      height: DSTheme.inputFieldHeight,
      margin: margin,
      child: InputDatePickerFormField(
        firstDate: DateTime(baseDate.year - 100, baseDate.month, baseDate.day),
        lastDate: DateTime(baseDate.year - 10, baseDate.month, baseDate.day),
        errorFormatText: errorFormatText,
        errorInvalidText: errorInvalidText,
        fieldLabelText: hintText,
        keyboardType: TextInputType.datetime,
        onDateSaved: onDateSaved,
      ),
    );
  }
}
