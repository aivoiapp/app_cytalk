import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger();

class DeepSeekApiService {
  final String apiKey;
  final String baseUrl;

  DeepSeekApiService({
    required this.apiKey,
    this.baseUrl = 'https://api.deepseek.com/v1',
  });

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> requestBody) async {
    try {
      final url = endpoint.startsWith('http') 
          ? Uri.parse(endpoint) 
          : Uri.parse('$baseUrl/$endpoint');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $apiKey',
          'Accept': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      final responseData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        return responseData;
      } else {
        logger.e('API Error: ${response.statusCode} - ${response.body}');
        throw Exception(
            'API Error ${response.statusCode}: ${responseData['error_msg'] ?? response.body}');
      }
    } catch (e) {
      logger.e('Exception occurred: $e');
      throw Exception('Failed to communicate with DeepSeek API: $e');
    }
  }

  Future<dynamic> chatCompletions(Map<String, dynamic> requestBody) async {
    return await postRequest('chat/completions', requestBody);
  }
}