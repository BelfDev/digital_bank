import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:camera/camera.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';

import 'dependents_dynamic_list_mixin.dart';

class ApplicationFormPage extends StatefulWidget {
  const ApplicationFormPage({
    super.key,
    required this.state,
    this.onSubmit,
  });

  final ApplicationFormPageState state;
  final VoidCallback? onSubmit;

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage>
    with DynamicDependentListMixin {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.state.formData.dependents = dependents;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return DSFormScaffold(
      formKey: state.formKey,
      padding: DSTheme.defaultPageMargin,
      controller: _scrollController,
      appBar: AppBar(
        leading: DSBackButton(),
        title: Text('New Application'),
      ),
      bodyChildren: [
        DSFormSection(
          title: 'Basic Information',
          children: [
            const SizedBox(height: 24.0),
            DSPhotoInput(
              hint: 'Your picture\n(liveliness check)',
              onImageCaptured: (filePath) {
                state.formData.photoPath = filePath;
              },
            ),
            const SizedBox(height: 24.0),
            DSTextInput(
              hintText: 'First name',
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.firstName = newValue;
              },
            ),
            DSTextInput(
              hintText: 'Last name',
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.lastName = newValue;
              },
            ),
            DSDatePickerInput(
              hintText: 'Date of birth',
              validator: state.formData.validator.validateBirthDateInput,
              onDateSelected: (selectedDate) {
                state.formData.birthDate = selectedDate;
              },
            ),
            DSDropdownInput(
              hintText: 'Gender',
              items: GenderOption.values,
              validator: state.formData.validator.validateGenderInput,
              onChanged: (newValue) {
                state.formData.gender = newValue;
              },
            ),
          ],
        ),
        DSFormSection(
          title: 'Dependents information',
          children: [
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
                  state.formData.validator.validateNameInput,
                );
              },
            ),
            const SizedBox(height: 24.0),
            DSOutlinedButton(
              text: 'add dependent',
              onPressed: () {
                spawnDependentTextInput();
                _scrollController.scrollToMaxExtentIfNeeded();
              },
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ],
      floatingButton: DSElevatedButton(
        enabled: !state.isLoading,
        width: double.infinity,
        onPressed: widget.onSubmit,
        text: 'submit application',
      ),
    );
  }
}

extension _ScrollExtension on ScrollController {
  void scrollToMaxExtentIfNeeded() {
    if (position.maxScrollExtent > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        animateTo(
          position.maxScrollExtent + 48.0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOut,
        );
      });
    }
  }
}
