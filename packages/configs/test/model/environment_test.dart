import 'package:configs/configs.dart';
import 'package:test/test.dart';

void main() {
  group('Environment:', () {
    test('given production outputs expected flowBankApiBaseUrl', () {
      expect(
        Environment.production.flowBankApiBaseUrl,
        equals('https://interview-backend-3enbou53tq-uc.a.run.app'),
      );
    });
  });
}
