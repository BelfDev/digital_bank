import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class ApplicationFeedbackPage extends StatelessWidget {
  const ApplicationFeedbackPage({
    super.key,
    this.onFloatingButtonPressed,
    this.onCopyPressed,
  });

  final VoidCallback? onFloatingButtonPressed;
  final void Function(String)? onCopyPressed;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;

    return DSArtworkScaffold(
      padding: DSTheme.defaultPageMargin,
      appBar: AppBar(
        leading: DSCloseButton(),
        leadingWidth: 64.0,
        backgroundColor: DSColors.smoothWhite,
        elevation: 0.0,
      ),
      imageProvider: const AssetImage(DSImages.applicationInProgress),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _Strings.applicationNumberIntro,
            style: styles.displayMedium,
          ),
          const SizedBox(height: 16.0),
          DSCodeContainer(
            code: '289',
            onCopyPressed: onCopyPressed,
          ),
          const SizedBox(height: 16.0),
          Text(
            _Strings.nextStepDisclaimer,
            style: styles.displaySmall,
          ),
        ],
      ),
      floatingButton: DSElevatedButton(
        width: double.infinity,
        text: _Strings.floatingButtonText,
        onPressed: onFloatingButtonPressed,
      ),
    );
  }
}

class _Strings {
  static const applicationNumberIntro = 'Your application number is...';
  static const nextStepDisclaimer =
      'You can use this number to check the application status in our website.';
  static const floatingButtonText = 'close';
}
