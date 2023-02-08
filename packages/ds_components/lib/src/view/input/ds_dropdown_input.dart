import 'package:flutter/material.dart';

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
  });

  final String hintText;

  final List<T>? items;

  final FormFieldValidator<T>? validator;

  final EdgeInsetsGeometry? margin;

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
        ?.map(
          (e) => DropdownMenuItem<T>(
            value: e,
            child: Text(e.displayName),
            // alignment: Alignment.center,
          ),
        )
        .toList();

    return Container(
      height: 60.0,
      margin: widget.margin,
      alignment: Alignment.bottomCenter,
      child: DropdownButtonFormField<T>(
        items: effectiveItems,
        value: _selectedValue,
        validator: widget.validator,
        elevation: 8,
        // dropdownColor: DSColors.blue,
        isExpanded: false,
        style: styles.textTheme.bodyMedium,
        alignment: Alignment.center,
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.hintText,
          isDense: true,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          errorStyle: const TextStyle(height: 0.6),
        ),
      ),
    );
  }
}
