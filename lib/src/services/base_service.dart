import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseService {
  final String baseUrl = 'http://localhost:3000';

  Map<String, String> get headers =>
      {'Content-Type': 'application/json; charset=UTF-8'};

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) {
    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<http.Response> get(String endpoint) {
    return http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
  }
}
