import 'package:configs/configs.dart';
import 'package:test/test.dart';

void main() {
  late Environment environment;
  setUpAll(
    () async {
      environment = Environment.test;
      await environment.init();
    },
  );

  group('Environment:', () {
    test('given environment outputs expected flowBankApiBaseUrl', () {
      expect(
        environment.flowBankApiBaseUrl,
        equals('https://api.flowbank.com/v1'),
      );
    });
  });
}
