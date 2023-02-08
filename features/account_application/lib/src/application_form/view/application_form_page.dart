import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import 'dependents_dynamic_list_mixin.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({super.key});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage>
    with DynamicDependentListMixin {
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
          childrenSpacing: DSTheme.defaultFormSpacing,
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
          ],
        ),
        DSFormSection(
          title: 'Dependents information',
          childrenSpacing: 0.0,
          children: [
            const SizedBox(height: DSTheme.defaultFormSpacing),
            AnimatedList(
              key: listKey,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              initialItemCount: dependentInputFields.length,
              itemBuilder: (_, index, animation) {
                return buildDependentTextInputItem(
                  dependentInputFields[index],
                  animation,
                );
              },
            ),
            DSOutlinedButton(
              text: 'add dependent',
              onPressed: () {
                spawnDependentTextInput();
              },
            ),
            const SizedBox(height: 120.0),
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
