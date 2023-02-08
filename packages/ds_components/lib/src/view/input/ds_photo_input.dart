import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import '../../resources/ds_transparent_image.dart';

class DSPhotoInput extends StatefulWidget {
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
  State<DSPhotoInput> createState() => _DSPhotoInputState();
}

class _DSPhotoInputState extends State<DSPhotoInput> {
  late bool isLoading;
  late ImageProvider? selectedImage;

  @override
  void initState() {
    super.initState();
    isLoading = widget.loading;
    selectedImage = widget.image;
  }

  @override
  void didUpdateWidget(covariant DSPhotoInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.loading != widget.loading) {
      isLoading = widget.loading;
    } else if (oldWidget.image != widget.image) {
      selectedImage = widget.image;
    }
  }

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
              color: widget.loading
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
              onTap: widget.onPressed,
              child: _resolveContentWidget(context),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          widget.hint,
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

    if (isLoading) {
      return CircularProgressIndicator();
    } else if (selectedImage != null) {
      return FadeInImage(
        image: selectedImage!,
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
