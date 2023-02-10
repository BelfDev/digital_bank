import 'package:flutter/material.dart';

import '../../../ds_components.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  /// Push [LoadingOverlay] as a modal dialog.
  static Future<void> present(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: DSColors.smoothBlueBackdrop,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const LoadingOverlay(),
      ),
    );
  }

  static Future<void> dismiss(BuildContext context) async {
    isModalVisible(BuildContext context) =>
        ModalRoute.of(context)?.isCurrent != true;
    if (isModalVisible(context)) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints.tight(const Size.square(107.0)),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            color: DSColors.smoothWhite,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: DSColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
