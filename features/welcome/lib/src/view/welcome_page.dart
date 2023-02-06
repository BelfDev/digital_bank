import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DSArtworkScaffold(
      // appBar: AppBar(
      //   title: const Text('Welcome'),
      // ),
      imageProvider: const AssetImage(DSImages.bankingApp),
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      body: Text('''Your Money,\nYour Way,\nDigital.'''),
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: () {},
        text: 'start application',
      ),
    );
  }
}
