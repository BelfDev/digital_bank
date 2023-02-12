import 'dart:convert';

import 'package:data_access/data_access.dart';
import 'package:data_access/src/service/api_client/background_json_parser.dart';
import 'package:test/test.dart';

void main() {
  group('BackgroundJsonParser:', () {
    test(
      'parseInBackground should return expected parsed object',
      () async {
        final expectedResult = AccountApplicationFeedbackStubs.defaultStub;
        final result = await BackgroundJsonParser(
          jsonEncode(AccountApplicationFeedbackStubs.defaultStub),
          AccountApplicationFeedback.fromJson,
        ).parseInBackground();

        expect(
          result,
          equals(expectedResult),
        );
      },
    );
  });
}
