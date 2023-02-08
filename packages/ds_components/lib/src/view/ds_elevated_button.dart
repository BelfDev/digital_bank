import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import '../theme/ds_gradients.dart';

class DSElevatedButton extends StatelessWidget {
  const DSElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.gradient = DSGradients.blueShades,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    final elevatedButtonStyle = Theme.of(context).elevatedButtonTheme.style;
    final effectiveHeight = height ??
        elevatedButtonStyle?.minimumSize
            ?.resolve({MaterialState.focused})?.height;

    return Container(
      width: width,
      height: effectiveHeight,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: DSTheme.buttonBorderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle,
        child: Text(text),
      ),
    );
  }
}
