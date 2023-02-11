import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';

import '../view/application_feedback_page.dart';

class ApplicationFeedbackPageController extends StatelessWidget {
  const ApplicationFeedbackPageController({
    super.key,
    required this.accountNumberCode,
  });

  final String accountNumberCode;

  @override
  Widget build(BuildContext context) {
    return ApplicationFeedbackPage(
      accountNumberCode: accountNumberCode,
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
    final l10n = L10n.of(context);
    await Clipboard.setData(
      ClipboardData(text: code),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(l10n.applicationFeedbackCopiedCode),
        ),
      ),
    );
  }
}
