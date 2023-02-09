import 'package:camera/src/view/camera_bottom_actions.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

import 'camera_background.dart';

class CameraLayout extends StatelessWidget {
  const CameraLayout({
    super.key,
    required this.state,
    this.onMediaTap,
  });

  final CameraState state;
  final OnMediaTap onMediaTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CameraBackground(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AwesomeCameraModeSelector(state: state),
                    CameraBottomActions(state: state, onMediaTap: onMediaTap),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
