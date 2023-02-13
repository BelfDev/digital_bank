import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ApplicationFeedbackPage extends StatelessWidget {
  const ApplicationFeedbackPage({
    super.key,
    required this.accountNumberCode,
    this.onClosePressed,
    this.onCopyPressed,
  });

  final VoidCallback? onClosePressed;
  final void Function(String)? onCopyPressed;
  final String accountNumberCode;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final styles = Theme.of(context).textTheme;

    return DSArtworkScaffold(
      padding: DSTheme.defaultPageMargin,
      appBar: DSAppBar.transparent(
        leading: DSCloseButton(
          onPressed: onClosePressed,
        ),
        leadingWidth: 64.0,
      ),
      imageProvider: const AssetImage(DSImages.applicationInProgress),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.applicationFeedbackIntro,
            style: styles.displayMedium,
          ),
          const SizedBox(height: 16.0),
          DSCodeContainer(
            code: accountNumberCode,
            onCopyPressed: onCopyPressed,
          ),
          const SizedBox(height: 16.0),
          Text(
            l10n.applicationFeedbackNextStepDisclaimer,
            style: styles.displaySmall,
          ),
          const SizedBox(height: 64.0),
        ],
      ),
      floatingButton: DSElevatedButton(
        width: double.infinity,
        text: l10n.applicationFeedbackFloatingButton,
        onPressed: onClosePressed,
      ),
    );
  }
}
