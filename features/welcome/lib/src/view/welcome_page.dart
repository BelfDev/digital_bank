import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    final sloganParts = _Strings.slogan.split('\n');

    return DSArtworkScaffold(
      imageProvider: const AssetImage(DSImages.bankingApp),
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
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
        onPressed: onPressed,
        text: _Strings.startApplication,
      ),
    );
  }
}

class _Strings {
  static const startApplication = 'start application';
  static const slogan = 'Your Money,\nYour Way,\nDigital.';
}
