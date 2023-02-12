import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/failure/remote_api_failure.dart';
import 'package:data_access/src/service/api_client/flow_bank_api_client_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import '../model/failure/failure_protocol.dart';
import '../model/outcome.dart';

@immutable
abstract class AccountRepositoryProtocol {
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  );
}

final _accountRepositoryProvider = Provider<AccountRepositoryProtocol>((ref) {
  final remoteDataSource = ref.watch(FlowBankApiClientService.provider);
  return AccountRepository(remoteDataSource);
});

class AccountRepository implements AccountRepositoryProtocol {
  const AccountRepository(this.remoteDataSource);

  final FlowBankApiClientServiceProtocol remoteDataSource;

  static Provider<AccountRepositoryProtocol> provider =
      _accountRepositoryProvider;

  @override
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  ) async {
    try {
      final result = await remoteDataSource.createAccount(application);
      return Outcome.success(result);
    } on FailureProtocol catch (e) {
      return Outcome.failure(e);
    } catch (e) {
      return Outcome.failure(RemoteApiFailure.generic());
    }
  }
}
