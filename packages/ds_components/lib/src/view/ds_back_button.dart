import 'package:flutter/material.dart';

import '../../ds_components.dart';

/// A [BackButton] is an [IconButton] with a "back" icon appropriate for the
/// current [TargetPlatform]. When pressed, the back button calls
/// [Navigator.maybePop] to return to the previous route unless a custom
/// [onPressed] callback is provided.
class DSCloseButton extends StatelessWidget {
  /// Creates an [IconButton] with the appropriate "back" icon for the current
  /// target platform.
  const DSBackButton({super.key, this.color, this.onPressed});

  /// The color to use for the icon.
  final Color? color;

  /// An override callback to perform instead of the default behavior which is
  /// to pop the [Navigator].
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: const _BackButtonIcon(),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
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

/// A "back" icon that's appropriate for the current [TargetPlatform].
class _BackButtonIcon extends StatelessWidget {
  const _BackButtonIcon({super.key});

  /// Returns the appropriate "back" icon for the given `platform`.
  static IconData _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios;
    }
  }

  @override
  Widget build(BuildContext context) => Icon(
        _getIconData(Theme.of(context).platform),
      );
}
