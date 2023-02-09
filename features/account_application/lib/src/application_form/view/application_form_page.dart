import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:camera/camera.dart';
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
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DSFormScaffold(
      formKey: _formKey,
      padding: DSTheme.defaultPageMargin,
      controller: _scrollController,
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return CameraPageController();
                  }),
                );
              },
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
            DSDatePickerInput(
              hintText: 'Date of birth',
            ),
            DSDropdownInput(
              hintText: 'Gender',
              items: GenderOption.values,
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
              initialItemCount: dependents.length,
              itemBuilder: (_, index, animation) {
                return buildDependentTextInputItem(
                  dependents[index],
                  index,
                  animation,
                );
              },
            ),
            DSOutlinedButton(
              text: 'add dependent',
              onPressed: () {
                spawnDependentTextInput();
                scrollToMaxExtentIfNeeded();
              },
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ],
      floatingButton: DSElevatedButton(
        width: double.infinity,
        onPressed: () {
          _formKey.currentState?.validate();
        },
        text: 'submit application',
      ),
    );
  }

  void scrollToMaxExtentIfNeeded() {
    if (_scrollController.position.maxScrollExtent > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 48.0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
        );
      });
    }
  }
}
