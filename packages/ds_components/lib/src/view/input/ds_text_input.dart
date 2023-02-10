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
    this.onTap,
    this.controller,
    this.readOnly = false,
  });

  final String hintText;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onRemove;

  final VoidCallback? onTap;

  final EdgeInsetsGeometry? margin;

  final String? initialValue;

  final ValueChanged<String>? onChanged;

  final TextInputAction? textInputAction;

  final TextEditingController? controller;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: DSTheme.inputFieldHeight,
      child: TextFormField(
        controller: controller,
        validator: validator,
        initialValue: initialValue,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap,
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