import 'package:flutter/widgets.dart';

/// A collection of static [LinearGradient] constants.
class DSGradients {
  const DSGradients._();

  /// [LinearGradient] with blue and green colors; 45 degrees angle.
  static const blueShades = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF4542E6),
      Color(0xFF2593EA),
    ],
  );
}
