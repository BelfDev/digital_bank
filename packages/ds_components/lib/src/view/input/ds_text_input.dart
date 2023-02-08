import 'package:flutter/material.dart';

import '../../../ds_components.dart';

class DSTextInput extends StatelessWidget {
  const DSTextInput({
    super.key,
    required this.hintText,
    this.validator,
    this.onRemove,
    this.margin,
  });

  final String hintText;

  final FormFieldValidator<String>? validator;

  final VoidCallback? onRemove;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Container(
      height: 60.0,
      margin: margin,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        validator: validator,
        style: styles.textTheme.bodySmall,
        textAlignVertical: TextAlignVertical.center,
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
        keyboardType: TextInputType.text,
      ),
    );
  }
}
