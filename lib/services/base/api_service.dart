// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

// base class connect with https

class ApiService {
  static final ApiService _instance = ApiService._i();
  ApiService._i();
  factory ApiService() => _instance;

  // base url
  static const String _baseUrl = 'https://news-api-nodejs.onrender.com';
  // static const String _baseUrl = 'http://localhost:3000';

  String? _token;

  void setToken(String? token) {
    _token = token;
  }

  // get
  Future<Map<String, dynamic>> get(String endpoint) async {
    final uri = Uri.parse(_baseUrl + endpoint);
    final headers = {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };

    print('GET to $uri with headers $headers');

    try {
      final response = await http
          .get(uri, headers: headers)
          .timeout(Duration(seconds: 30));

      print('Response GET $uri with ${response.body}');
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json;
      } else {
        throw Exception(json['message'] ?? 'API error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('API ERROR $e');
    }
  }

  // post
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_baseUrl + endpoint);
    final headers = {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
    body ??= {};

    print('POST to $uri with headers $headers');

    try {
      final response = await http
          .post(uri, body: jsonEncode(body), headers: headers)
          .timeout(Duration(seconds: 30));

      print('Response POST $uri with ${response.body}');

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json;
      } else {
        throw Exception(json['message'] ?? 'API error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('API ERROR $e');
    }
  }
}
