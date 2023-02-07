import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import '../resources/ds_transparent_image.dart';

class DSPhotoInput extends StatelessWidget {
  const DSPhotoInput({
    super.key,
    required this.onPressed,
    required this.hint,
    this.loading = false,
    this.image,
  });

  final VoidCallback? onPressed;
  final String hint;
  final bool loading;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 240),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: loading
                  ? styles.colorScheme.onSecondaryContainer
                  : styles.colorScheme.secondaryContainer,
              border: Border.all(
                width: 1.0,
                color: styles.colorScheme.onSecondaryContainer,
              )),
          constraints: BoxConstraints.tight(Size.square(80.0)),
          child: Material(
            color: DSColors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: _resolveContentWidget(context),
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

  Widget _resolveContentWidget(BuildContext context) {
    final styles = Theme.of(context);

    if (loading) {
      return CircularProgressIndicator();
    } else if (image != null) {
      return FadeInImage(
        image: image!,
        placeholder: MemoryImage(dsTransparentImage),
      );
    } else {
      return Icon(
        Icons.camera_alt_outlined,
        size: 28.0,
        color: styles.inputDecorationTheme.labelStyle?.color,
      );
    }
  }
}
