import 'dart:convert';

import 'package:configs/configs.dart';
import 'package:data_access/data_access.dart';
import 'package:data_access/src/service/encryption/background_decryption.dart';
import 'package:test/test.dart';

void main() {
  group('BackgroundDecryption:', () {
    late Environment environment;

    setUpAll(
      () async {
        environment = Environment.test;
        await environment.init();
      },
    );

    test(
      'encryptInBackground should expected EncryptedData',
      () async {
        const encryptedPayload =
            '2kT1OKWcpWrPv5qJTtFueMdPRax2AReYrZ8/3SpnGFh1lU8dPWYihWLB1MvFW2PTs/zEPOwiKDxGchY4TzlAkGgCJzbUnndtcAhgkweNq+82OIcv8SFW4lvjWx2fRKleMnhev0tNJMUQxlwBNrW1hAwA65+TvLbbS+TMzHTheHbVPVZSTBvFOlPQ97GIHVG6tZWlyO1OFYJRyGV7uN91+yMmaGs3kDTxqT6REty9vXkmCFw1BDKPccViNMLQ/iSBTD5StafilYVW8iSEK/urdjjd/l5xOwDDuL26cExg7+TvWdfjQZG1MnnhPFtxnC/v';
        final result = await BackgroundDecryption(
          jsonEncode({
            'encryptedResponse': encryptedPayload,
          }),
          environment.encryptionConfig,
        ).decryptInBackground();

        expect(
          result,
          equals(jsonEncode(AccountApplicationStubs.defaultStub)),
        );
      },
    );
  });
}
