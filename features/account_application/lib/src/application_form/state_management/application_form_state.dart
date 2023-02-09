import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:equatable/equatable.dart';

class ApplicationFormState extends Equatable {
  const ApplicationFormState({
    required this.isLoading,
    required this.formData,
  });

  ApplicationFormState.initial()
      : this(
          isLoading: false,
          formData: ApplicationFormData(
            dependents: [],
          ),
        );

  final bool isLoading;
  final ApplicationFormData formData;

  @override
  List<Object?> get props => [
        isLoading,
        formData,
      ];
}

extension ApplicationFormStateStubs on ApplicationFormState {
  static ApplicationFormState get defaultStub {
    return ApplicationFormState(
      isLoading: false,
      formData: ApplicationFormDataStubs.defaultStub,
    );
  }
}
