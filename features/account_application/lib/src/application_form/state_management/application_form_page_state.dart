import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:account_application/src/application_form/model/form_validator_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ApplicationFormPageState extends Equatable {
  const ApplicationFormPageState({
    required this.isLoading,
    required this.formData,
    required this.formKey,
  });

  ApplicationFormPageState.initial()
      : this(
          isLoading: false,
          formData: ApplicationFormData(
            validator: FormValidatorUserCase(),
            dependents: [],
          ),
          formKey: GlobalKey<FormState>(),
        );

  final bool isLoading;
  final ApplicationFormData formData;
  final GlobalKey<FormState> formKey;

  @override
  List<Object?> get props => [
        isLoading,
        formData,
      ];
}

extension ApplicationFormStateStubs on ApplicationFormPageState {
  static ApplicationFormPageState get defaultStub {
    return ApplicationFormPageState(
      isLoading: false,
      formData: ApplicationFormDataStubs.defaultStub,
      formKey: GlobalKey<FormState>(),
    );
  }
}
