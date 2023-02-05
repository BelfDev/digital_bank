import 'package:meta/meta.dart';

@immutable
abstract class ApiClientServiceProtocol {
  const ApiClientServiceProtocol({
    required this.baseUrl,
  });

  final String baseUrl;
}
