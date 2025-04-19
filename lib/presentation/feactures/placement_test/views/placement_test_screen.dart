import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cytalk/models/question_model.dart'; // Ensure this model exists
import 'package:cytalk/presentation/feactures/placement_test/views/question_view.dart'; // Corrected path
import 'package:cytalk/presentation/feactures/placement_test/views/progress_bar.dart'; // Corrected path
import 'package:cytalk/presentation/resources/resources.dart';
import 'package:go_router/go_router.dart';

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
        backgroundColor: AppColors.backgroundGradientStart,
        elevation: 0,
        centerTitle: true,
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
          
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.buttonGradientStart,
                          AppColors.inputFill,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryText),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(28.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.buttonGradientStart,
                          AppColors.inputFill,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      '$_timeRemaining sec',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.buttonGradientStart,
                          AppColors.inputFill,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Text(
                      'Excess Time: $_excessTimeCounter',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.primaryText),
                    ),
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
                            _answers[currentQuestionIndex] = selectedOption;
                          });
                        },
                        selectedAnswer: _answers[currentQuestionIndex],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (currentQuestionIndex > 0)
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  currentQuestionIndex--;
                                  selectedAnswer = _answers[currentQuestionIndex];
                                  _timeRemaining = 30;
                                  _startTimer();
                                });
                              },
                              child: const Text('Previous'),
                            )
                          else
                            const SizedBox(width: 100),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backgroundGradientStart,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: selectedAnswer == null
                                ? null
                                : () {
                                    setState(() {
                                      _answers[currentQuestionIndex] = selectedAnswer;
                                      if (currentQuestionIndex < widget.questions.length - 1) {
                                        currentQuestionIndex++;
                                        selectedAnswer = _answers[currentQuestionIndex];
                                        _timeRemaining = 30;
                                        _startTimer();
                                      } else {
                                        GoRouter.of(context).go('/result_loader');
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