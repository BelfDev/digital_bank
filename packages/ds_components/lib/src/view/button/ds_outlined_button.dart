import 'package:flutter/material.dart';

class DSOutlinedButton extends StatelessWidget {
  const DSOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final outlinedButtonStyle = Theme.of(context).outlinedButtonTheme.style;

    return OutlinedButton(
      onPressed: onPressed,
      style: outlinedButtonStyle,
      child: Text(text),
    );
  }
}
