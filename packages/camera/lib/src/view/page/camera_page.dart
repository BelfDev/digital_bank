import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/camera_layout.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({
    super.key,
    required this.pathBuilder,
    required this.onMediaTap,
  });

  final FilePathBuilder pathBuilder;

  final OnMediaTap onMediaTap;

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
      body: CameraAwesomeBuilder.custom(
        saveConfig: SaveConfig.photo(
          pathBuilder: pathBuilder,
        ),
        builder: (
          CameraState state,
          PreviewSize previewSize,
          Rect previewRect,
        ) {
          return CameraLayout(
            state: state,
            onMediaTap: onMediaTap,
          );
        },
        filter: AwesomeFilter.None,
        flashMode: FlashMode.none,
        aspectRatio: CameraAspectRatios.ratio_16_9,
        sensor: Sensors.front,
        previewFit: CameraPreviewFit.cover,
        enableAudio: false,
        exifPreferences: null,
      ),
    );
  }
}
