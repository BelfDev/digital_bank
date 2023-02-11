import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:account_application/src/application_form/state_management/application_form_page_state.dart';
import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

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
    final l10n = L10n.of(context);
    final state = widget.state;

    return DSFormScaffold(
      formKey: state.formKey,
      padding: DSTheme.defaultPageMargin,
      controller: _scrollController,
      appBar: DSAppBar.title(
        l10n.applicationFormAppBarTitle,
        leading: DSBackButton(),
      ),
      bodyChildren: [
        const SizedBox(height: 32.0),
        DSFormSection(
          title: l10n.applicationFormBasicInfoSection,
          children: [
            DSPhotoInput(
              hint: l10n.applicationFormPhotoInputHint,
              onImageCaptured: (filePath) {
                state.formData.photoPath = filePath;
              },
            ),
            const SizedBox(height: 24.0),
            DSTextInput(
              hintText: l10n.applicationFormFirstNameInputHint,
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.firstName = newValue;
              },
            ),
            DSTextInput(
              hintText: l10n.applicationFormLastNameInputHint,
              validator: state.formData.validator.validateNameInput,
              onChanged: (newValue) {
                state.formData.lastName = newValue;
              },
            ),
            DSDatePickerInput(
              hintText: l10n.applicationFormBirthDateInputHint,
              validator: state.formData.validator.validateBirthDateInput,
              onDateSelected: (selectedDate) {
                state.formData.birthDate = selectedDate;
              },
            ),
            DSDropdownInput(
              hintText: l10n.applicationFormGenderInputHint,
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
          title: l10n.applicationFormDependentsInfoSection,
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
              text: l10n.applicationFormAddDependentButton,
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
        text: l10n.applicationFormSubmitApplicationFloatingButton,
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
