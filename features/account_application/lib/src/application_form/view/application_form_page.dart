import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class ApplicationFormPage extends StatelessWidget {
  const ApplicationFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DSFormScaffold(
      padding: DSTheme.defaultPageMargin,
      appBar: AppBar(
        leading: DSBackButton(),
        title: Text('New Application'),
      ),
      body: Center(
        child: Text('Hello world'),
      ),
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: () {},
        text: 'submit application',
      ),
    );
  }
}
