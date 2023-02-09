import 'dart:io';

import 'package:camera/src/view/photo_preview_page.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'camera_layout.dart';

// TODO(BelfDev): Move to its own package
class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

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
          pathBuilder: () => _path(CaptureMode.photo),
        ),
        builder: (
          CameraState state,
          PreviewSize previewSize,
          Rect previewRect,
        ) {
          return CameraLayout(
            state: state,
            onMediaTap: (MediaCapture mediaCapture) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PhotoPreviewPage(mediaCapture: mediaCapture);
                  },
                ),
              );
            },
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

  Future<String> _path(CaptureMode captureMode) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir = await Directory(
      '${extDir.path}/digital-bank/liveliness-check',
    ).create(recursive: true);
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return filePath;
  }
}
