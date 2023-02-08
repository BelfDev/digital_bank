import 'package:flutter/material.dart';

class DSTextInput extends StatelessWidget {
  const DSTextInput({
    super.key,
    required this.hintText,
    this.validator,
  });

  final String hintText;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return TextFormField(
      validator: validator,
      style: styles.textTheme.bodySmall,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        isDense: true,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      keyboardType: TextInputType.text,
    );
  }
}
