import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
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
      appBar: DSAppBar.title(
        _Strings.appBarTitle,
        leading: DSBackButton(),
      ),
      bodyChildren: [
        const SizedBox(height: 32.0),
        DSFormSection(
          title: _Strings.basicInfoSectionTitle,
          children: [
            DSPhotoInput(
              hint: _Strings.photoInputHint,
              onImageCaptured: (filePath) {
                state.formData.photoPath = filePath;
              },
            ),
            const SizedBox(height: 24.0),
            DSTextInput(
              hintText: _Strings.firstNameInputHint,
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.firstName = newValue;
              },
            ),
            DSTextInput(
              hintText: _Strings.lastNameInputHint,
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.lastName = newValue;
              },
            ),
            DSDatePickerInput(
              hintText: _Strings.birthDateInputHint,
              validator: state.formData.validator.validateBirthDateInput,
              onDateSelected: (selectedDate) {
                state.formData.birthDate = selectedDate;
              },
            ),
            DSDropdownInput(
              hintText: _Strings.genderInputHint,
              items: GenderOption.values,
              validator: state.formData.validator.validateGenderInput,
              onChanged: (newValue) {
                state.formData.gender = newValue;
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        DSFormSection(
          title: _Strings.dependentsSectionTitle,
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
            DSOutlinedButton(
              text: _Strings.addDependentButton,
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
        text: _Strings.submitApplicationButton,
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

class _Strings {
  static const appBarTitle = 'New Application';
  static const basicInfoSectionTitle = 'Basic Information';
  static const photoInputHint = 'Your picture\n(liveliness check)';
  static const firstNameInputHint = 'First Name';
  static const lastNameInputHint = 'Last Name';
  static const birthDateInputHint = 'Date of Birth';
  static const genderInputHint = 'Gender';
  static const dependentsSectionTitle = 'Dependents Information';
  static const addDependentButton = 'add dependent';
  static const submitApplicationButton = 'submit application';
}
