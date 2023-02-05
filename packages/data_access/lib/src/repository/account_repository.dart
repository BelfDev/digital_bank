import 'package:data_access/src/model/account_application.dart';
import 'package:data_access/src/model/account_application_feedback.dart';
import 'package:data_access/src/model/failure/remore_api_failure.dart';
import 'package:data_access/src/service/api_client/flow_bank_api_client_service.dart';

import '../model/outcome.dart';

abstract class AccountRepositoryProtocol {
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  );
}

class AccountRepository implements AccountRepositoryProtocol {
  const AccountRepository(this.remoteDataSource);

  final FlowBankApiClientService remoteDataSource;

  @override
  Future<Outcome<AccountApplicationFeedback>> createAccount(
    AccountApplication application,
  ) async {
    try {
      final result = await remoteDataSource.createAccount(application);
      return Outcome.success(result);
    } catch (e) {
      return Outcome.failure(
        e.deriveFailure(RemoteApiFailure()),
      );
    }
  }
}
