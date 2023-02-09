import 'dart:io';

import 'package:camera/src/view/page/camera_page.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../view/page/photo_preview_page.dart';

class CameraPageController extends StatelessWidget {
  const CameraPageController({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraPage(
      pathBuilder: () => _resolvePhotoPath(CaptureMode.photo),
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
  }

  Future<String> _resolvePhotoPath(CaptureMode captureMode) async {
    if (captureMode != CaptureMode.photo) {
      throw Exception('Unsupported capture mode');
    }

    final Directory extDir = await getTemporaryDirectory();
    final photoPath = Environment.current.livelinessCheckConfig.photoPath;
    final testDir = await Directory(
      '${extDir.path}$photoPath',
    ).create(recursive: true);
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return filePath;
  }
}
