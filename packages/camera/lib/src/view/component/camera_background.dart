import 'package:flutter/material.dart';

class CameraBackground extends StatelessWidget {
  const CameraBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: child,
    );
  }
}
