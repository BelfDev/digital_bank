import 'package:ds_components/src/theme/public_themes.dart';
import 'package:flutter/material.dart';

class DSDatePickerInput extends StatelessWidget {
  const DSDatePickerInput({
    super.key,
    required this.hintText,
    this.margin,
    this.onDateSubmitted,
    this.errorFormatText,
    this.errorInvalidText,
  });

  final String hintText;

  final EdgeInsetsGeometry? margin;

  /// An optional method to call when the user indicates they are done editing
  /// the text in the field. Will only be called if the input represents a valid
  /// [DateTime].
  final ValueChanged<DateTime>? onDateSubmitted;

  /// The error text displayed if the entered date is not in the correct format.
  final String? errorFormatText;

  /// The error text displayed if the date is not valid.
  final String? errorInvalidText;

  @override
  Widget build(BuildContext context) {
    final baseDate = DateTime.now();
    return Container(
      height: DSTheme.inputFieldHeight,
      margin: margin,
      child: InputDatePickerFormField(
        firstDate: DateTime(baseDate.year - 100, baseDate.month, baseDate.day),
        lastDate: DateTime(baseDate.year - 10, baseDate.month, baseDate.day),
        onDateSubmitted: onDateSubmitted,
        errorFormatText: errorFormatText,
        errorInvalidText: errorInvalidText,
        fieldLabelText: hintText,
        keyboardType: TextInputType.datetime,
      ),
    );
  }
}
