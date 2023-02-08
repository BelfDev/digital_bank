import 'package:flutter/material.dart';

import '../../../ds_components.dart';

class DSTextInput extends StatelessWidget {
  const DSTextInput({
    super.key,
    required this.hintText,
    this.validator,
    this.onRemove,
    this.margin,
    this.initialValue,
    this.onChanged,
    this.textInputAction,
  });

  final String hintText;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onRemove;

  final EdgeInsetsGeometry? margin;

  final String? initialValue;

  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Container(
      height: 60.0,
      margin: margin,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        validator: validator,
        initialValue: initialValue,
        onChanged: onChanged,
        style: styles.textTheme.bodySmall,
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        keyboardType: TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          isDense: true,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorStyle: const TextStyle(height: 0.6),
          suffixIcon: onRemove != null
              ? IconButton(
                  icon: const Icon(
                    Icons.delete_forever,
                    size: 24.0,
                  ),
                  splashRadius: 24.0,
                  onPressed: onRemove,
                )
              : null,
          suffixIconColor: DSColors.pink,
        ),
      ),
    );
  }
}
