import 'package:flutter/material.dart';

class DSCodeContainer extends StatelessWidget {
  const DSCodeContainer({
    super.key,
    required this.code,
    this.onCopyPressed,
  });

  final String code;
  final void Function(String)? onCopyPressed;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);
    final onTap = onCopyPressed != null ? () => onCopyPressed!(code) : null;
    const iconSize = 28.0;

    return Material(
      color: styles.colorScheme.tertiaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 80.0, minWidth: 120.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: iconSize),
                Center(
                  child: Text(
                    code,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: styles.textTheme.headlineLarge?.copyWith(
                      color: styles.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
                Icon(
                  Icons.copy_outlined,
                  size: iconSize,
                  color: styles.colorScheme.onTertiaryContainer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
