import 'dart:convert';

import 'package:configs/configs.dart';
import 'package:data_access/data_access.dart';
import 'package:data_access/src/model/encrypted_data.dart';
import 'package:data_access/src/service/encryption/encryption_service.dart';
import 'package:test/test.dart';

class _EncryptionConsumer with EncryptionService {}

void main() {
  group('EncryptionService:', () {
    late _EncryptionConsumer encryptionProvider;
    late Environment environment;

    setUpAll(
      () async {
        environment = Environment.test;
        await environment.init();
      },
    );

    setUp(() {
      encryptionProvider = _EncryptionConsumer();
    });

    test(
      'encrypt should return encrypted payload',
      () async {
        const expectedEncryptedResponse =
            '2kT1OKWcpWrPv5qJTtFueMdPRax2AReYrZ8/3SpnGFh1lU8dPWYihWLB1MvFW2PTs/zEPOwiKDxGchY4TzlAkGgCJzbUnndtcAhgkweNq+82OIcv8SFW4lvjWx2fRKleMnhev0tNJMUQxlwBNrW1hAwA65+TvLbbS+TMzHTheHbVPVZSTBvFOlPQ97GIHVG6tZWlyO1OFYJRyGV7uN91+yMmaGs3kDTxqT6REty9vXkmCFw1BDKPccViNMLQ/iSBTD5StafilYVW8iSEK/urdjjd/l5xOwDDuL26cExg7+TvWdfjQZG1MnnhPFtxnC/v';
        final payload = AccountApplicationStubs.defaultStub;
        final result = await encryptionProvider.encrypt(
          payload,
          environment.encryptionConfig,
        );

        expect(
          result,
          equals(expectedEncryptedResponse),
        );
      },
    );

    test(
      'decrypt should return decrypted payload',
      () async {
        final expectedUnencryptedResponse = jsonEncode(
          AccountApplicationStubs.defaultStub,
        );
        const encryptedResponse =
            '2kT1OKWcpWrPv5qJTtFueMdPRax2AReYrZ8/3SpnGFh1lU8dPWYihWLB1MvFW2PTs/zEPOwiKDxGchY4TzlAkGgCJzbUnndtcAhgkweNq+82OIcv8SFW4lvjWx2fRKleMnhev0tNJMUQxlwBNrW1hAwA65+TvLbbS+TMzHTheHbVPVZSTBvFOlPQ97GIHVG6tZWlyO1OFYJRyGV7uN91+yMmaGs3kDTxqT6REty9vXkmCFw1BDKPccViNMLQ/iSBTD5StafilYVW8iSEK/urdjjd/l5xOwDDuL26cExg7+TvWdfjQZG1MnnhPFtxnC/v';

        final payload = EncryptedData(payload: encryptedResponse);
        final result = await encryptionProvider.decrypt(
          payload,
          environment.encryptionConfig,
        );

        expect(
          result,
          equals(expectedUnencryptedResponse),
        );
      },
    );
  });
}
