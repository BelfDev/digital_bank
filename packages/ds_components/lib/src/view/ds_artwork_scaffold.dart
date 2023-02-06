import 'package:flutter/material.dart';

import 'ds_artwork_image.dart';

class DSArtworkScaffold extends StatelessWidget {
  const DSArtworkScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.imageProvider,
    this.floatingButton,
    this.padding,
  });

  /// An app bar to display at the top of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The primary content of the scaffold.
  final Widget body;

  /// The image to display.
  final ImageProvider? imageProvider;

  /// A button displayed floating above [body], aligned to the bottom center.
  final Widget? floatingButton;

  /// The amount of space by which to inset the body.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveButton = floatingButton != null
        ? Padding(padding: padding ?? EdgeInsets.zero, child: floatingButton!)
        : null;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: padding,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (imageProvider != null) DSArtworkImage(imageProvider!),
              body,
              if (effectiveButton != null) const SizedBox(height: 48.0),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: effectiveButton,
    );
  }
}
