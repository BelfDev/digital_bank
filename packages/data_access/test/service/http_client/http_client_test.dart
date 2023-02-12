import 'dart:async';
import 'dart:convert';
import 'dart:io' as dart_io;

import 'package:data_access/src/service/http_client/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateNiceMocks([
  MockSpec<dart_io.HttpClient>(
    as: Symbol('MockDartHttpClient'),
  ),
  MockSpec<dart_io.HttpClientRequest>(
    as: Symbol('MockDartHttpClientRequest'),
  ),
  MockSpec<dart_io.HttpClientResponse>(
    as: Symbol('MockDartHttpClientResponse'),
  ),
  MockSpec<dart_io.HttpHeaders>(
    as: Symbol('MockDartHttpHeaders'),
  )
])
import 'http_client_test.mocks.dart';

void main() {
  group('HttpClient:', () {
    late HttpClientProtocol httpClient;
    late MockDartHttpClient dartHttpClient;

    setUp(() {
      httpClient = HttpClient();
      dartHttpClient = MockDartHttpClient();
    });

    test(
      'when 200 then get should return the expected response',
      () async {
        const expectedResponse = "Hello World!";

        dart_io.HttpOverrides.runZoned(() async {
          final response = await httpClient.get(
            'https://picsum.photos',
            '200',
          );

          expect(response.body, expectedResponse);

          verify(dartHttpClient.openUrl(any, any)).called(1);
          verify(dartHttpClient.close(force: true)).called(1);
          verifyNoMoreInteractions(dartHttpClient);
        }, createHttpClient: (_) {
          final request = MockDartHttpClientRequest();
          final response = MockDartHttpClientResponse();
          final headers = MockDartHttpHeaders();

          when(dartHttpClient.openUrl(any, any)).thenAnswer(
            (_) => Future.value(request),
          );

          when(request.close()).thenAnswer(
            (_) {
              when(response.handleError(any, test: anyNamed('test')))
                  .thenAnswer(
                (invocation) => Stream.fromFuture(
                  Future.value(utf8.encode(expectedResponse)),
                ),
              );
              when(response.headers).thenAnswer((_) => headers);
              when(response.statusCode).thenAnswer((_) => 200);

              return Future.value(response);
            },
          );

          return dartHttpClient;
        });
      },
    );

    test(
      'when io throws then get should return a ClientException',
      () async {
        dart_io.HttpOverrides.runZoned(() async {
          final response = httpClient.get(
            'https://picsum.photos',
            '400',
          );

          await expectLater(
            () async => await response,
            throwsA(isA<http.ClientException>()),
          );

          verify(dartHttpClient.openUrl(any, any)).called(1);
          verify(dartHttpClient.close(force: true)).called(1);
          verifyNoMoreInteractions(dartHttpClient);
        }, createHttpClient: (_) {
          final request = MockDartHttpClientRequest();
          final response = MockDartHttpClientResponse();
          final headers = MockDartHttpHeaders();

          when(dartHttpClient.openUrl(any, any)).thenAnswer(
            (_) => Future.value(request),
          );

          when(request.close()).thenAnswer(
            (_) {
              when(response.handleError(any, test: anyNamed('test'))).thenThrow(
                dart_io.HttpException('Some client exception'),
              );
              when(response.headers).thenAnswer((_) => headers);

              return Future.value(response);
            },
          );

          return dartHttpClient;
        });
      },
    );

    test(
      'when 200 then post should return the expected response',
      () async {
        const expectedResponse = "Hello World!";

        dart_io.HttpOverrides.runZoned(() async {
          final response = await httpClient.post(
            'https://picsum.photos',
            '200',
            body: 'Somebody',
          );

          expect(response.body, expectedResponse);

          verify(dartHttpClient.openUrl(any, any)).called(1);
          verify(dartHttpClient.close(force: true)).called(1);
          verifyNoMoreInteractions(dartHttpClient);
        }, createHttpClient: (_) {
          final request = MockDartHttpClientRequest();
          final response = MockDartHttpClientResponse();
          final headers = MockDartHttpHeaders();

          when(request.headers).thenAnswer((_) => headers);
          when(dartHttpClient.openUrl(any, any)).thenAnswer(
            (_) => Future.value(request),
          );

          when(request.close()).thenAnswer(
            (_) {
              when(response.handleError(any, test: anyNamed('test')))
                  .thenAnswer(
                (invocation) => Stream.fromFuture(
                  Future.value(utf8.encode(expectedResponse)),
                ),
              );
              when(response.headers).thenAnswer((_) => headers);
              when(response.statusCode).thenAnswer((_) => 200);

              return Future.value(response);
            },
          );

          return dartHttpClient;
        });
      },
    );

    test(
      'when io throws then post should return a ClientException',
      () async {
        dart_io.HttpOverrides.runZoned(() async {
          final response = httpClient.post(
            'https://picsum.photos',
            '400',
            body: 'Somebody',
          );

          await expectLater(
            () async => await response,
            throwsA(isA<http.ClientException>()),
          );

          verify(dartHttpClient.openUrl(any, any)).called(1);
          verify(dartHttpClient.close(force: true)).called(1);
          verifyNoMoreInteractions(dartHttpClient);
        }, createHttpClient: (_) {
          final request = MockDartHttpClientRequest();
          final response = MockDartHttpClientResponse();
          final headers = MockDartHttpHeaders();

          when(request.headers).thenAnswer((_) => headers);
          when(dartHttpClient.openUrl(any, any)).thenAnswer(
            (_) => Future.value(request),
          );

          when(request.close()).thenAnswer(
            (_) {
              when(response.handleError(any, test: anyNamed('test'))).thenThrow(
                dart_io.HttpException('Some client exception'),
              );
              when(response.headers).thenAnswer((_) => headers);

              return Future.value(response);
            },
          );

          return dartHttpClient;
        });
      },
    );

    test(
      'buildUri should return a well formed Uri',
      () async {
        final uri = httpClient.buildUri(
          'https://picsum.photos',
          '200',
        );
        expect(
          uri.toString(),
          'https://picsum.photos/200',
        );
      },
    );
  });
}
