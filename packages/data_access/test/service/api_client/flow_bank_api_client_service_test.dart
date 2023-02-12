import 'dart:convert';

import 'package:configs/configs.dart';
import 'package:data_access/data_access.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:data_access/src/service/http_client/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([MockSpec<HttpClientProtocol>()])
import 'flow_bank_api_client_service_test.mocks.dart';

void main() {
  group('FlowBankApiClientService:', () {
    late MockHttpClientProtocol mockHttpClient;
    late FlowBankApiClientServiceProtocol apiClientService;
    late Environment environment;
    const encryptedResponse = 'Hecqmby7fVUZbj+hxTOI+mY+BJBW29AjMSms8X5ljIA=';

    setUpAll(
      () async {
        environment = Environment.test;
        await environment.init();
      },
    );

    setUp(() {
      mockHttpClient = MockHttpClientProtocol();
      apiClientService = FlowBankApiClientService(
        environment,
        client: mockHttpClient,
      );
    });

    test(
      'when status code 200 then createAccount should return AccountApplicationFeedback',
      () async {
        final expectedResult = AccountApplicationFeedbackStubs.defaultStub;
        when(mockHttpClient.post(any, any, body: anyNamed('body'))).thenAnswer(
          (_) async => http.Response(
            json.encode({
              'encryptedResponse': encryptedResponse,
            }),
            200,
          ),
        );

        final result = await apiClientService.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        expect(
          result,
          equals(expectedResult),
        );

        verify(mockHttpClient.post(any, any, body: anyNamed('body'))).called(1);
        verifyNoMoreInteractions(mockHttpClient);
      },
    );

    test(
      'when status code 400 then createAccount should throw RemoteApiFailure.clientError',
      () async {
        when(mockHttpClient.post(any, any, body: anyNamed('body'))).thenAnswer(
          (_) async => http.Response(
            json.encode({
              'encryptedResponse': encryptedResponse,
            }),
            400,
          ),
        );

        final createAccountFuture = apiClientService.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        await expectLater(
          createAccountFuture,
          throwsA(RemoteApiFailure.clientError()),
        );

        verify(mockHttpClient.post(any, any, body: anyNamed('body'))).called(1);
        verifyNoMoreInteractions(mockHttpClient);
      },
    );

    test(
      'when status code 500 then createAccount should throw RemoteApiFailure.serverError',
      () async {
        when(mockHttpClient.post(any, any, body: anyNamed('body'))).thenAnswer(
          (_) async => http.Response(
            json.encode({
              'encryptedResponse': encryptedResponse,
            }),
            500,
          ),
        );

        final createAccountFuture = apiClientService.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        await expectLater(
          createAccountFuture,
          throwsA(RemoteApiFailure.serverError()),
        );

        verify(mockHttpClient.post(any, any, body: anyNamed('body'))).called(1);
        verifyNoMoreInteractions(mockHttpClient);
      },
    );

    test(
      'when status code 301 then createAccount should throw RemoteApiFailure.serverError',
      () async {
        when(mockHttpClient.post(any, any, body: anyNamed('body'))).thenAnswer(
          (_) async => http.Response(
            json.encode({
              'encryptedResponse': encryptedResponse,
            }),
            301,
          ),
        );

        final createAccountFuture = apiClientService.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        await expectLater(
          createAccountFuture,
          throwsA(RemoteApiFailure.generic()),
        );

        verify(mockHttpClient.post(any, any, body: anyNamed('body'))).called(1);
        verifyNoMoreInteractions(mockHttpClient);
      },
    );

    test(
      'when exception then createAccount should rethrow',
      () async {
        final expectedException = ArgumentError('Test exception');
        when(mockHttpClient.post(any, any, body: anyNamed('body'))).thenThrow(
          expectedException,
        );

        final createAccountFuture = apiClientService.createAccount(
          AccountApplicationStubs.defaultStub,
        );

        await expectLater(
          createAccountFuture,
          throwsA(expectedException),
        );

        verify(mockHttpClient.post(any, any, body: anyNamed('body'))).called(1);
        verifyNoMoreInteractions(mockHttpClient);
      },
    );
  });
}
