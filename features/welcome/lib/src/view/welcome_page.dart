import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    this.onFloatingButtonPressed,
  });

  final VoidCallback? onFloatingButtonPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final styles = Theme.of(context).textTheme;
    final sloganParts = l10n.welcomeSlogan.split('\n');

    return DSArtworkScaffold(
      padding: DSTheme.defaultPageMargin,
      imageProvider: const AssetImage(DSImages.bankingApp),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: RichText(
          text: TextSpan(
            children: [
              ...sloganParts.map(
                (part) => TextSpan(
                  text: '$part\n',
                  style: styles.displayLarge?.copyWith(
                    fontWeight: part == sloganParts.last
                        ? FontWeight.bold
                        : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: onFloatingButtonPressed,
        text: l10n.welcomeFloatingButton,
      ),
    );
  }
}
