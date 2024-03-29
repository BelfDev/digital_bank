// Mocks generated by Mockito 5.3.2 from annotations
// in data_access/test/service/api_client/flow_bank_api_client_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data_access/src/service/http_client/http_client.dart' as _i3;
import 'package:http/http.dart' as _i2;
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

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpClientProtocol].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClientProtocol extends _i1.Mock
    implements _i3.HttpClientProtocol {
  @override
  _i4.Future<_i2.Response> get(
    String? baseUrl,
    String? path, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [
            baseUrl,
            path,
          ],
          {#headers: headers},
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [
              baseUrl,
              path,
            ],
            {#headers: headers},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #get,
            [
              baseUrl,
              path,
            ],
            {#headers: headers},
          ),
        )),
      ) as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> post(
    String? baseUrl,
    String? path, {
    Map<String, String>? headers,
    required Object? body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [
            baseUrl,
            path,
          ],
          {
            #headers: headers,
            #body: body,
          },
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [
              baseUrl,
              path,
            ],
            {
              #headers: headers,
              #body: body,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #post,
            [
              baseUrl,
              path,
            ],
            {
              #headers: headers,
              #body: body,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response>);
}
