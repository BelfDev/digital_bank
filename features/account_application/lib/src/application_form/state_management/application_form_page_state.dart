import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:account_application/src/application_form/model/form_validator_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class ApplicationFormPageState extends Equatable {
  const ApplicationFormPageState({
    required this.isLoading,
    required this.formData,
    required this.formKey,
    this.errorFeedback,
    this.accountNumber,
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

  final String? errorFeedback;
  final String? accountNumber;

  bool get hasError => errorFeedback?.isNotEmpty ?? false;

  @override
  List<Object?> get props => [
        isLoading,
        formData,
        formKey,
        errorFeedback,
        accountNumber,
      ];

  ApplicationFormPageState copyWith({
    bool? isLoading,
    ApplicationFormData? formData,
    GlobalKey<FormState>? formKey,
    String? errorFeedback,
    String? accountNumber,
  }) =>
      ApplicationFormPageState(
        isLoading: isLoading ?? this.isLoading,
        formData: formData ?? this.formData,
        formKey: formKey ?? this.formKey,
        errorFeedback: errorFeedback ?? this.errorFeedback,
        accountNumber: accountNumber ?? this.accountNumber,
      );
}

extension ApplicationFormStateStubs on ApplicationFormPageState {
  static ApplicationFormPageState get defaultStub {
    return ApplicationFormPageState(
      isLoading: false,
      formData: ApplicationFormDataStubs.defaultStub,
      formKey: GlobalKey<FormState>(),
      errorFeedback: null,
      accountNumber: null,
    );
  }
}
