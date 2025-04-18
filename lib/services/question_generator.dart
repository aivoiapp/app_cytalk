import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cytalk/models/question_model.dart';
import 'deepseek_api_service.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class QuestionGenerator {
  final DeepSeekApiService _deepSeekApiService;

  QuestionGenerator({required DeepSeekApiService deepSeekApiService})
      : _deepSeekApiService = deepSeekApiService;

  Future<List<Question>> generatePlacementTestQuestions(
    Map<String, dynamic> userData,
    Locale locale,
  ) async {
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
  - "question": text in ${locale.languageCode}
  - "options": array of 4 answers
  - "correctAnswer": the correct option
  - "level": A1/A2/B1/B2/C1
  - "skill": grammar/vocabulary/reading

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
    } catch (e) {
      logger.e('Error generating questions: $e');
      rethrow;
    }
  }

  List<Question> _parseQuestions(dynamic response) {
    try {
      final content = response['choices'][0]['message']['content'];
      final jsonString = content.replaceAll(RegExp(r'^```json|```$'), '').trim();
      final jsonResponse = json.decode(jsonString) as List;
      return jsonResponse.map((json) => Question.fromJson(json)).toList();
    } catch (e) {
      logger.e('Error parsing questions: $e');
      throw Exception('Failed to parse questions from API response: $e');
    }
  }
}