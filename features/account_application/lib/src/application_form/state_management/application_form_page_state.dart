import 'package:account_application/src/application_form/model/application_form_data.dart';
import 'package:equatable/equatable.dart';

class ApplicationFormPageState extends Equatable {
  const ApplicationFormPageState({
    required this.isLoading,
    required this.formData,
  });

  ApplicationFormPageState.initial()
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

extension ApplicationFormStateStubs on ApplicationFormPageState {
  static ApplicationFormPageState get defaultStub {
    return ApplicationFormPageState(
      isLoading: false,
      formData: ApplicationFormDataStubs.defaultStub,
    );
  }
}
