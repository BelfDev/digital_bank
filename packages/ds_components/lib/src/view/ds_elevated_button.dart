import 'package:flutter/material.dart';

import '../theme/ds_gradients.dart';

class DSElevatedButton extends StatelessWidget {
  const DSElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.height = 64.0,
    this.gradient = DSGradients.blueShades,
  });

  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double height;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16.0));

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(text),
      ),
    );
  }
}
