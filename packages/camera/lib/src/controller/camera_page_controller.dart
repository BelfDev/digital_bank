import 'package:camera/src/use_case/path_use_case.dart';
import 'package:camera/src/view/page/camera_page.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

import '../view/page/photo_preview_page.dart';

class CameraPageController extends StatelessWidget {
  const CameraPageController({
    super.key,
    this.pathUseCase = const PathUseCase(),
  });

  final PathUseCase pathUseCase;

  @override
  Widget build(BuildContext context) {
    return CameraPage(
      pathBuilder: () => pathUseCase.resolvePhotoPath(CaptureMode.photo),
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
}
