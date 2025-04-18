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
            ProgressBar(
              currentStep: currentQuestionIndex + 1,
              totalSteps: widget.questions.length,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: QuestionView(
                  question: widget.questions[currentQuestionIndex],
                  onOptionSelected: (selectedOption) {
                    setState(() {
                      selectedAnswer = selectedOption;
                      // Aquí podrías guardar la respuesta seleccionada
                    });
                  },
                  selectedAnswer: selectedAnswer,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionIndex > 0)
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          currentQuestionIndex--;
                          selectedAnswer = null;
                        });
                      },
                      child: const Text('Previous'),
                    )
                  else
                    const SizedBox(width: 100),
                  ElevatedButton(
                    onPressed: selectedAnswer == null
                        ? null
                        : () {
                            setState(() {
                              if (currentQuestionIndex <
                                  widget.questions.length - 1) {
                                currentQuestionIndex++;
                                selectedAnswer = null;
                              } else {
                                // Navegar a los resultados
                                Navigator.pushNamed(
                                    context, '/test_results');
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
            ),
          ],
        ),
      ),
    );
  }
}