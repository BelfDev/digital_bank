import 'package:flutter/material.dart';

class DSArtworkImage extends StatelessWidget {
  const DSArtworkImage(
    this.imageProvider, {
    super.key,
  });

  final ImageProvider<Object> imageProvider;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final effectiveImage = ResizeImage.resizeIfNeeded(
        (390 * devicePixelRatio).round(), null, imageProvider);

    return AspectRatio(
      aspectRatio: 390.0 / 377.0,
      child: Image(
        image: effectiveImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
