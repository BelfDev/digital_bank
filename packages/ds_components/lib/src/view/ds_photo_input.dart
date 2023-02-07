import 'package:flutter/material.dart';

class DSPhotoInput extends StatelessWidget {
  const DSPhotoInput({
    super.key,
    required this.onPressed,
    required this.hint,
  });

  final VoidCallback? onPressed;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: styles.colorScheme.secondaryContainer,
          shape: CircleBorder(
            side: BorderSide(
              width: 1.0,
              color: styles.colorScheme.onSecondaryContainer,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onPressed,
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size.square(80.0)),
              child: Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 28.0,
                  color: styles.inputDecorationTheme.labelStyle?.color,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          hint,
          textAlign: TextAlign.center,
          style: styles.textTheme.bodyMedium?.copyWith(
            color: styles.inputDecorationTheme.labelStyle?.color,
          ),
        )
      ],
    );
  }
}
