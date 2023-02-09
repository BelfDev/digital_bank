import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:configs/configs.dart';
import 'package:path_provider/path_provider.dart';

class PathUseCase {
  const PathUseCase();

  Future<String> resolvePhotoPath(CaptureMode captureMode) async {
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
