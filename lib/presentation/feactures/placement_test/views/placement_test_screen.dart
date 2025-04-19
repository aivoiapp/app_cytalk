import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cytalk/models/question_model.dart'; // Ensure this model exists
import 'package:cytalk/presentation/feactures/placement_test/views/question_view.dart'; // Corrected path
import 'package:cytalk/presentation/feactures/placement_test/views/progress_bar.dart'; // Corrected path
import 'package:cytalk/presentation/resources/resources.dart';

class PlacementTestScreen extends StatefulWidget {
  final List<Question> questions; // Ensure Question model is defined

  const PlacementTestScreen({
    super.key,
    required this.questions,
  });

  @override
  PlacementTestScreenState createState() => PlacementTestScreenState();
}

class PlacementTestScreenState extends State<PlacementTestScreen> {
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  Timer? _timer;
  int _timeRemaining = 30; // 30 seconds per question
  int _excessTimeCounter = 0; // Counter for time exceeded
  final Map<int, String?> _answers = {}; // Store answers for each question

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Inicializar el temporizador solo si no está ya inicializado
    _timer?.cancel(); // Cancelar el temporizador existente si no es null
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        setState(() {
          _excessTimeCounter++; // Incrementar el contador de tiempo excedido
        });
        _timeRemaining = 30; // Reiniciar el temporizador para el siguiente ciclo
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Placement Test',
          style: AppTextStyles.headlineMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundGradientStart,
              AppColors.backgroundGradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryText),
                  ),
                  Text(
                    'Time: $_timeRemaining sec',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secondaryText),
                  ),
                  Text(
                    'Excess Time: $_excessTimeCounter',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
            ProgressBar(
              currentStep: currentQuestionIndex + 1,
              totalSteps: widget.questions.length,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.backgroundGradientStart.withOpacity(0.5),
                        AppColors.backgroundGradientEnd.withOpacity(0.5),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [
                      QuestionView(
                        question: widget.questions[currentQuestionIndex],
                        onOptionSelected: (selectedOption) {
                          setState(() {
                            selectedAnswer = selectedOption;
                            _answers[currentQuestionIndex] = selectedOption; // Store the answer
                          });
                        },
                        selectedAnswer: _answers[currentQuestionIndex], // Retrieve stored answer
                      ),
                      const SizedBox(height: 16), // Add spacing between questions and buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currentQuestionIndex > 0)
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  currentQuestionIndex--;
                                  selectedAnswer = _answers[currentQuestionIndex]; // Retrieve stored answer
                                  _timeRemaining = 30; // Reset timer for previous question
                                  _startTimer();
                                });
                              },
                              child: const Text('Previous'),
                            )
                          else
                            const SizedBox(width: 100),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backgroundGradientStart, // Correct parameter name
                              foregroundColor: Colors.white, // Correct parameter name
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: selectedAnswer == null
                                ? null
                                : () {
                                    setState(() {
                                      _answers[currentQuestionIndex] = selectedAnswer; // Store the answer
                                      if (currentQuestionIndex < widget.questions.length - 1) {
                                        currentQuestionIndex++;
                                        selectedAnswer = _answers[currentQuestionIndex]; // Retrieve stored answer
                                        _timeRemaining = 30; // Reset timer for next question
                                        _startTimer();
                                      } else {
                                        // Navegar a los resultados
                                        Navigator.pushNamed(context, '/test_results');
                                      }
                                    });
                                  },
                            child: Text(
                              currentQuestionIndex < widget.questions.length - 1
                                  ? 'Next'
                                  : 'Finish',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}