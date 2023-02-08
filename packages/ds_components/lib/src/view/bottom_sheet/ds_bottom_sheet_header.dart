import 'package:flutter/material.dart';

import '../../theme/ds_theme.dart';

/// A widget that represents the top-most region of a bottom sheet.
class BottomSheetHeader extends StatelessWidget {
  /// Creates a widget that represents the top-most region of a bottom sheet.
  const BottomSheetHeader({
    required this.title,
    this.subtitle,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
    Key? key,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(
        minHeight: 85.0,
      ),
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: DSTheme.bottomSheetBorderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 3.0,
                  width: 34.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: styles.colorScheme.secondary,
                    borderRadius: const BorderRadius.all(Radius.circular(26.0)),
                  ),
                ),
              )
            ],
          ),
          FittedBox(
            child: Text(
              title,
              style: styles.textTheme.bodyLarge?.copyWith(
                height: 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8.0),
            Text(
              subtitle!,
              style: styles.textTheme.bodyMedium?.copyWith(
                height: 1.3,
              ),
            ),
            const SizedBox(height: 16.0),
          ]
        ],
      ),
    );
  }
}
