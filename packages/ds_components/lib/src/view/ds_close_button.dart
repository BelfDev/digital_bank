import 'package:flutter/material.dart';

import '../../ds_components.dart';

/// A Material Design close button.
class DSCloseButton extends StatelessWidget {
  /// Creates a Material Design close button.
  const DSCloseButton({super.key, this.color, this.onPressed});

  /// The color to use for the icon.
  final Color? color;

  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: const Icon(Icons.close_rounded),
      color: color,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      splashRadius: DSTheme.iconSplashRadius,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
