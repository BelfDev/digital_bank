import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import '../../resources/ds_transparent_image.dart';

class DSPhotoInput extends StatefulWidget {
  const DSPhotoInput({
    super.key,
    required this.hint,
    this.onPressed,
    this.onImageCaptured,
  });

  final VoidCallback? onPressed;
  final String hint;
  final ValueChanged<String>? onImageCaptured;

  @override
  State<DSPhotoInput> createState() => _DSPhotoInputState();
}

class _DSPhotoInputState extends State<DSPhotoInput> {
  bool isLoading = false;
  ImageProvider? capturedImage;

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
              color: isLoading
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
              onTap: widget.onPressed ?? _handlePhotoCapture,
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
    } else if (capturedImage != null) {
      return FadeInImage(
        image: capturedImage!,
        fit: BoxFit.cover,
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

  void _handlePhotoCapture() async {
    final filePath = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => CameraPageController(),
      ),
    );

    if (!mounted) return;

    if (filePath == null) {
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      setState(() {
        isLoading = false;
        capturedImage = FileImage(
          File(filePath),
        );
      });

      widget.onImageCaptured?.call(filePath);
    }
  }
}
