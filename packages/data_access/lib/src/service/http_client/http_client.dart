import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class HttpClientProtocol {
  Future<http.Response> get(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
  });

  Future<http.Response> post(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
    required Object? body,
  });
}

class HttpClient implements HttpClientProtocol {
  const HttpClient({
    this.timeLimit = const Duration(seconds: 10),
  });

  final Duration timeLimit;

  @override
  Future<http.Response> get(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
  }) {
    final uri = Uri.parse('$baseUrl/$path');
    return http.get(uri).timeout(timeLimit);
  }

  @override
  Future<http.Response> post(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) {
    final uri = Uri.parse('$baseUrl/$path');
    return http
        .post(
          uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(body),
        )
        .timeout(timeLimit);
  }
}
