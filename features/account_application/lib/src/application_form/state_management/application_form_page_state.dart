import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:account_application/src/application_form/model/form_validator_use_case.dart';
import 'package:data_access/data_access.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class ApplicationFormPageState extends Equatable {
  const ApplicationFormPageState({
    required this.isLoading,
    required this.formData,
    this.errorFeedback,
    this.accountNumber,
  });

  ApplicationFormPageState.initial()
      : this(
          isLoading: false,
          formData: ApplicationFormData(
            validator: const FormValidatorUserCase(),
            dependents: [],
          ),
          errorFeedback: null,
        );

  final bool isLoading;
  final ApplicationFormData formData;

  final ErrorFeedbackType? errorFeedback;
  final String? accountNumber;

  bool get hasError =>
      errorFeedback != null && errorFeedback != ErrorFeedbackType.none;

  @override
  List<Object?> get props => [
        isLoading,
        formData,
        errorFeedback,
        accountNumber,
      ];

  ApplicationFormPageState copyWith({
    bool? isLoading,
    ApplicationFormData? formData,
    GlobalKey<FormState>? formKey,
    ErrorFeedbackType? errorFeedback,
    String? accountNumber,
  }) =>
      ApplicationFormPageState(
        isLoading: isLoading ?? this.isLoading,
        formData: formData ?? this.formData,
        errorFeedback: errorFeedback ?? this.errorFeedback,
        accountNumber: accountNumber ?? this.accountNumber,
      );
}

extension ApplicationFormStateStubs on ApplicationFormPageState {
  static ApplicationFormPageState get defaultStub {
    return ApplicationFormPageState(
      isLoading: false,
      formData: ApplicationFormDataStubs.defaultStub,
      errorFeedback: null,
      accountNumber: null,
    );
  }
}
