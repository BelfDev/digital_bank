import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import '../../theme/ds_gradients.dart';

class DSElevatedButton extends StatelessWidget {
  const DSElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.gradient = DSGradients.blueShades,
    this.enabled = true,
  });

  final bool enabled;
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
        gradient: enabled ? gradient : null,
        borderRadius: DSTheme.buttonBorderRadius,
      ),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: elevatedButtonStyle,
        child: Text(text),
      ),
    );
  }
}
