import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DSFormScaffold(
      formKey: _formKey,
      padding: DSTheme.defaultPageMargin,
      appBar: AppBar(
        leading: DSBackButton(),
        title: Text('New Application'),
      ),
      bodyChildren: [
        DSFormSection(
          title: 'Basic Information',
          children: [
            DSPhotoInput(
              hint: 'Your picture\n(liveliness check)',
              loading: false,
              onPressed: () {},
            ),
            DSTextInput(
              hintText: 'First name',
              validator: (value) {
                return null;
              },
            ),
            DSTextInput(
              hintText: 'Last name',
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
            ),
          ],
        ),
        DSFormSection(
          title: 'Dependents information',
          children: [
            TextFormField(
              validator: (value) {
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                return null;
              },
            ),
            DSOutlinedButton(
              text: 'add dependent',
              onPressed: () {
                DSDecisionBottomSheet.present(
                  context,
                  headerTitle: 'Are you sure you want to remove John Doe?',
                  message: 'This action is irreversible.',
                  onConfirm: () {
                    print('confirmed');
                  },
                  confirmationText: 'remove',
                );
              },
            ),
          ],
        ),
      ],
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: () {},
        text: 'submit application',
      ),
    );
  }
}
