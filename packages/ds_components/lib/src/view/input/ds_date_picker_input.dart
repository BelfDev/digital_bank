import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DSDatePickerInput extends StatefulWidget {
  const DSDatePickerInput({
    super.key,
    required this.hintText,
    required this.onDateSelected,
    this.margin,
    this.validator,
  });

  final String hintText;

  final EdgeInsetsGeometry? margin;

  final void Function(DateTime dateTime)? onDateSelected;

  final FormFieldValidator<String>? validator;

  @override
  State<DSDatePickerInput> createState() => _DSDatePickerInputState();
}

class _DSDatePickerInputState extends State<DSDatePickerInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DSTheme.inputFieldHeight,
      margin: widget.margin,
      child: DSTextInput(
        controller: _controller,
        hintText: widget.hintText,
        validator: widget.validator,
        readOnly: true,
        onTap: _pickDate,
      ),
    );
  }

  Future<void> _pickDate() async {
    final baseDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: DateTime(
        baseDate.year - 18,
        baseDate.month,
        baseDate.day,
      ),
      firstDate: DateTime(
        baseDate.year - 100,
        baseDate.month,
        baseDate.day,
      ),
      lastDate: DateTime(
        baseDate.year - 10,
        baseDate.month,
        baseDate.day,
      ),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat.yMd().format(pickedDate);
      setState(() {
        _controller.text = formattedDate;
      });

      widget.onDateSelected?.call(pickedDate);
    }
  }
}
