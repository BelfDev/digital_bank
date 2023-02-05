import 'package:configs/configs.dart';
import 'package:meta/meta.dart';

import 'api_client_service_protocol.dart';

@immutable
class FlowBankApiClientService implements ApiClientServiceProtocol {
  FlowBankApiClientService(Environment environment)
      : baseUrl = environment.flowBankApiBaseUrl;

  @override
  final String baseUrl;
}
