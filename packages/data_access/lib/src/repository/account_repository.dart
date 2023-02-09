import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:data_access/src/service/api_client/flow_bank_api_client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import '../model/outcome.dart';

@immutable
abstract class AccountRepositoryProtocol {
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  );
}

final _accountRepositoryProvider = Provider((ref) {
  final remoteDataSource = ref.watch(FlowBankApiClientService.provider);
  return AccountRepository(remoteDataSource);
});

class AccountRepository implements AccountRepositoryProtocol {
  const AccountRepository(this.remoteDataSource);

  final FlowBankApiClientService remoteDataSource;

  static Provider<AccountRepository> provider = _accountRepositoryProvider;

  @override
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  ) async {
    try {
      final result = await remoteDataSource.createAccount(application);
      return Outcome.success(result);
    } catch (e) {
      return Outcome.failure(
        e.deriveFailure(RemoteApiFailure.generic()),
      );
    }
  }
}
