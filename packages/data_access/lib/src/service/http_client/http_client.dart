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
    return http
        .get(
          _buildUri(baseUrl, path),
        )
        .timeout(timeLimit);
  }

  @override
  Future<http.Response> post(
    String baseUrl,
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return http
        .post(
          _buildUri(baseUrl, path),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(body),
        )
        .timeout(timeLimit);
  }

  Uri _buildUri(String baseUrl, String path) {
    return Uri.parse('$baseUrl/$path');
  }
}
