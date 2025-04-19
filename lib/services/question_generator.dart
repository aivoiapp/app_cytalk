import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cytalk/models/question_model.dart';
import 'deepseek_api_service.dart';
import 'package:logger/logger.dart';
import 'package:cytalk/presentation/feactures/splash/services/connectivity_service.dart';

final logger = Logger();

class QuestionGenerator {
  final DeepSeekApiService _deepSeekApiService;

  QuestionGenerator({required DeepSeekApiService deepSeekApiService})
      : _deepSeekApiService = deepSeekApiService;

  Future<List<Question>> generatePlacementTestQuestions(
    Map<String, dynamic> userData,
    Locale locale,
  ) async {
    // Verificar conectividad antes de generar preguntas
    final connectivityService = ConnectivityService();
    final isConnected = await connectivityService.checkConnection();
    
    if (!isConnected) {
      logger.e('Sin conexión a internet');
      throw Exception('Sin conexión a internet. Por favor verifica tu conexión.');
    }
    
    try {
      final requestBody = {
        'model': 'deepseek-chat',
        'messages': [
          {
            'role': 'system',
            'content': '''
You are a professional English test designer. Create a JSON array of 15 questions:
- 5 grammar, 5 vocabulary, 5 reading comprehension
- Levels: A1 to C1
- Each question must include:
  - "question": text in english
  - "answer": text in english
  - "options": array of 4 answers
  - "correctAnswer": the correct option
  - "level": A1/A2/B1/B2/C1
  - "skill": grammar/vocabulary/reading
  - "topic": random

Personalize for:
- Name: ${userData['name']}
- Age: ${userData['age']}
- Gender: ${userData['gender']}
- Current level: ${userData['level']}

Return ONLY the JSON array. No explanations.
'''
          },
          {
            'role': 'user',
            'content': 'Generate the test questions now'
          }
        ],
        'temperature': 0.7,
        'max_tokens': 3000,
      };

      final response = await _deepSeekApiService.chatCompletions(requestBody);
      return _parseQuestions(response);
    } on FormatException catch (e) {
      logger.e('Error de formato en la generación de preguntas: $e');
      throw Exception('Error al procesar la respuesta. Por favor, intenta nuevamente.');
    } catch (e) {
      logger.e('Error generando preguntas: $e');
      // Convertir el error técnico en un mensaje amigable para el usuario
      if (e.toString().contains('429')) {
        throw Exception('Has excedido el límite de consultas. Por favor, intenta más tarde.');
      } else if (e.toString().contains('internet')) {
        throw Exception('Sin conexión a internet. Por favor verifica tu conexión.');
      } else {
        throw Exception('No se pudieron generar las preguntas. Por favor, intenta nuevamente.');
      }
    }
  }

  List<Question> _parseQuestions(dynamic response) {
    try {
      final content = response['choices'][0]['message']['content'];
      final jsonString = content.replaceAll(RegExp(r'^```json|```$'), '').trim();
      final jsonResponse = json.decode(jsonString) as List;
      return jsonResponse.map((json) => Question.fromJson(json)).toList();
    } catch (e) {
      logger.e('Error al procesar las preguntas: $e');
      throw Exception('No se pudieron procesar las preguntas. Por favor, intenta nuevamente.');
    }
  }
}