import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

class CameraBottomActions extends StatelessWidget {
  const CameraBottomActions({
    super.key,
    required this.state,
    this.onMediaTap,
  });

  final CameraState state;
  final OnMediaTap onMediaTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: StreamBuilder<MediaCapture?>(
            stream: state.captureState$,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(width: 60.0, height: 60.0);
              }
              return SizedBox(
                width: 60.0,
                child: AwesomeMediaPreview(
                  mediaCapture: snapshot.requireData,
                  onMediaTap: onMediaTap,
                ),
              );
            },
          ),
        ),
        AwesomeCaptureButton(
          state: state,
        ),
        Flexible(
          child: const SizedBox(width: 60.0, height: 60.0),
        ),
      ],
    );
  }
}
