import 'package:cytalk/presentation/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:cytalk/models/question_model.dart';

class QuestionView extends StatelessWidget {
  final Question question;
  final Function(String) onOptionSelected;
  final String? selectedAnswer;

  const QuestionView({
    super.key, 
    required this.question,
    required this.onOptionSelected,
    this.selectedAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText, // Ensure text is visible
                ),
          ),
          const SizedBox(height: 24),
          ...question.options.map((option) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: selectedAnswer == option
                      ? Theme.of(context).primaryColor
                      : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryPurple.withOpacity(0.9),
                          AppColors.inputFill.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        option,
                        style: TextStyle(color: AppColors.primaryText), // Ensure text is visible
                      ),
                      trailing: Radio<String>(
                        value: option,
                        groupValue: selectedAnswer,
                        onChanged: (value) => onOptionSelected(value!),
                      ),
                      onTap: () => onOptionSelected(option),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}