import 'package:account_application/src/application_form/model/form_validator_use_case.dart';
import 'package:account_application/src/application_form/model/gender_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<BuildContext>(as: Symbol('MockBuildContext')),
])
import 'form_validator_use_case_test.mocks.dart';

void main() {
  late FormValidatorUseCase useCase;
  late MockBuildContext mockContext;
  late L10n l10n;

  setUpAll(() async {
    l10n = await L10n.delegate.load(Locale('en'));
  });

  setUp(() {
    useCase = FormValidatorUseCase();
    mockContext = MockBuildContext();
  });

  group('FormValidatorUserCase:', () {
    group('validateNameInput:', () {
      test(
        'when value is empty validateNameInput should return l10n.validationFeedbackEmptyValue',
        () async {
          final input = '   ';
          final result = useCase.validateNameInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackEmptyValue));
        },
      );

      test(
        'when value is null validateNameInput should return l10n.validationFeedbackEmptyValue',
        () async {
          final input = null;
          final result = useCase.validateNameInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackEmptyValue));
        },
      );

      test(
        'when value length is greater than 200 then validateNameInput should return l10n.validationFeedbackInputLength',
        () async {
          final input = '${'0123456789' * 20}a';
          final result = useCase.validateNameInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackInputLength));
        },
      );

      test(
        'when value length is less than 200 then validateNameInput should return null',
        () async {
          final input = '0123456789' * 20;
          final result = useCase.validateNameInput(mockContext, input);

          expect(result, isNull);
        },
      );
    });

    group('validateBirthDateInput:', () {
      test(
        'when value is empty validateBirthDateInput should return l10n.validationFeedbackEmptyValue',
        () async {
          final input = '   ';
          final result = useCase.validateBirthDateInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackEmptyValue));
        },
      );

      test(
        'when value is null validateBirthDateInput should return l10n.validationFeedbackEmptyValue',
        () async {
          final input = null;
          final result = useCase.validateBirthDateInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackEmptyValue));
        },
      );

      test(
        'when date is malformed validateBirthDateInput should return l10n.validationFeedbackInvalidDate',
        () async {
          final input = '36-3989-398';
          final result = useCase.validateBirthDateInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackInvalidDate));
        },
      );

      test(
        'when date is after now validateBirthDateInput should return l10n.validationFeedbackInvalidDate',
        () async {
          final input =
              DateTime.now().add(Duration(days: 100)).toIso8601String();
          final result = useCase.validateBirthDateInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackInvalidDate));
        },
      );

      test(
        'when date is valid validateBirthDateInput should return null',
        () async {
          final input = DateFormat.yMd().format(
            DateTime.now().subtract(Duration(days: 7000)),
          );

          final result = useCase.validateBirthDateInput(mockContext, input);

          expect(result, isNull);
        },
      );
    });

    group('validateGenderInput:', () {
      test(
        'when value is null validateGenderInput should return l10n.validationFeedbackEmptyValue',
        () async {
          final input = null;
          final result = useCase.validateGenderInput(mockContext, input);

          expect(result, equals(l10n.validationFeedbackEmptyValue));
        },
      );

      test(
        'when gender is valid validateGenderInput should return null',
        () async {
          final input = GenderOption.female;
          final result = useCase.validateGenderInput(mockContext, input);

          expect(result, isNull);
        },
      );
    });
  });
}
