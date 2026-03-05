import 'dart:convert';

import 'package:client/core/constants/app_constants.dart';
import 'package:http/http.dart' as http;

/// HTTP-клиент для вызова API (Clean: используется только в data/datasources).
/// TODO: заменить на dio с interceptors, таймаутами и единой обработкой ошибок.
class ApiClient {
  static const String _baseUrl = AppConstants.apiBaseUrl;

  /// Valid status code for the API response
  static const int validStatusCode = 200;

  /// POST /chat — ответ ИИ. Используй в ChatRemoteDatasourceImpl.
  static Future<String> getChatResponse(String message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );
    if (response.statusCode == validStatusCode) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return data['reply'] as String;
    }
    throw Exception('Failed to get chat response');
  }
}
