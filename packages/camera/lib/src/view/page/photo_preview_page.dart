import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhotoPreviewPage extends StatelessWidget {
  const PhotoPreviewPage({
    super.key,
    required this.mediaCapture,
  });

  final MediaCapture mediaCapture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DSCloseButton(
          color: DSColors.smoothWhite,
        ),
        leadingWidth: 64.0,
        backgroundColor: Colors.black,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: SafeArea(
            top: false,
            child: Center(
              child: Image(
                fit: BoxFit.cover,
                image: ResizeImage(
                  FileImage(
                    File(mediaCapture.filePath),
                  ),
                  width: constraints.maxWidth.round(),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
