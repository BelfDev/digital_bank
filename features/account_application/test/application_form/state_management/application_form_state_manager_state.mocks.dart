// Mocks generated by Mockito 5.3.2 from annotations
// in account_application/test/application_form/state_management/application_form_state_manager_state.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data_access/src/model/account_application.dart' as _i6;
import 'package:data_access/src/model/account_application_feedback.dart' as _i5;
import 'package:data_access/src/model/outcome.dart' as _i2;
import 'package:data_access/src/repository/account_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeOutcome_0<S> extends _i1.SmartFake implements _i2.Outcome<S> {
  _FakeOutcome_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AccountRepositoryProtocol].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockAccountRepository extends _i1.Mock
    implements _i3.AccountRepositoryProtocol {
  @override
  _i4.Future<_i2.Outcome<_i5.AccountApplicationFeedback>> createAccount(
          _i6.AccountApplication? application) =>
      (super.noSuchMethod(
        Invocation.method(
          #createAccount,
          [application],
        ),
        returnValue:
            _i4.Future<_i2.Outcome<_i5.AccountApplicationFeedback>>.value(
                _FakeOutcome_0<_i5.AccountApplicationFeedback>(
          this,
          Invocation.method(
            #createAccount,
            [application],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Outcome<_i5.AccountApplicationFeedback>>.value(
                _FakeOutcome_0<_i5.AccountApplicationFeedback>(
          this,
          Invocation.method(
            #createAccount,
            [application],
          ),
        )),
      ) as _i4.Future<_i2.Outcome<_i5.AccountApplicationFeedback>>);
}
