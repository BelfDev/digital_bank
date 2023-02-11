import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view/application_feedback_page.dart';

class ApplicationFeedbackPageController extends StatelessWidget {
  const ApplicationFeedbackPageController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ApplicationFeedbackPage(
      onClosePressed: () {
        Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
      },
      onCopyPressed: (code) => _copyApplicationCodeToClipboard(context, code),
    );
  }

  Future<void> _copyApplicationCodeToClipboard(
    BuildContext context,
    String code,
  ) async {
    await Clipboard.setData(
      ClipboardData(text: code),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(_Strings.copyFeedback),
        ),
      ),
    );
  }
}

class _Strings {
  static const copyFeedback = 'copied application code';
}
