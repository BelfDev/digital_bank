import 'package:flutter/material.dart';

import '../../../ds_components.dart';

abstract class DSDropdownOption {
  String get displayName;
}

class DSDropdownInput<T extends DSDropdownOption> extends StatefulWidget {
  const DSDropdownInput({
    super.key,
    required this.hintText,
    this.items,
    this.validator,
    this.margin,
    this.onChanged,
  });

  final String hintText;

  final List<T>? items;

  final FormFieldValidator<T>? validator;

  final EdgeInsetsGeometry? margin;

  final ValueChanged<T?>? onChanged;

  @override
  State<DSDropdownInput<T>> createState() => _DSDropdownInputState<T>();
}

class _DSDropdownInputState<T extends DSDropdownOption>
    extends State<DSDropdownInput<T>> {
  T? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    final effectiveItems = widget.items
        ?.map((e) => DropdownMenuItem<T>(
              value: e,
              child: Text(e.displayName),
              alignment: Alignment.center,
            ))
        .toList();

    return Container(
      height: DSTheme.inputFieldHeight,
      margin: widget.margin,
      child: DropdownButtonFormField<T>(
        items: effectiveItems,
        value: _selectedValue,
        validator: widget.validator,
        isExpanded: false,
        style: styles.textTheme.bodyMedium,
        alignment: Alignment.center,
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged?.call(value);
        },
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          isDense: true,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
