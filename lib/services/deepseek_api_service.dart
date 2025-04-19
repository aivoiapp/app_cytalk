import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:cytalk/presentation/feactures/splash/services/connectivity_service.dart';

final logger = Logger();

class DeepSeekApiService {
  final String apiKey;
  final String baseUrl;

  DeepSeekApiService({
    required this.apiKey,
    this.baseUrl = 'https://api.deepseek.com/v1',
  });

  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> requestBody) async {
    // Verificar conectividad antes de hacer la petición
    final connectivityService = ConnectivityService();
    final isConnected = await connectivityService.checkConnection();
    
    if (!isConnected) {
      logger.e('Sin conexión a internet');
      throw Exception('Sin conexión a internet. Por favor verifica tu conexión.');
    }
    
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
      } else if (response.statusCode == 429) {
        // Manejo específico para límite de API excedido
        logger.e('Límite de API excedido: ${response.statusCode} - ${response.body}');
        throw Exception('Has excedido el límite de consultas a la API. Por favor, intenta más tarde.');
      } else {
        logger.e('API Error: ${response.statusCode} - ${response.body}');
        throw Exception(
            'Error en la API ${response.statusCode}: ${responseData['error_msg'] ?? "Ocurrió un error al procesar tu solicitud"}');
      }
    } on FormatException catch (e) {
      logger.e('Error de formato: $e');
      throw Exception('Error al procesar la respuesta del servidor. Por favor, intenta más tarde.');
    } catch (e) {
      logger.e('Exception occurred: $e');
      throw Exception('No se pudo comunicar con el servicio de DeepSeek. Por favor, intenta más tarde.');
    }
  }

  Future<dynamic> chatCompletions(Map<String, dynamic> requestBody) async {
    return await postRequest('chat/completions', requestBody);
  }
}