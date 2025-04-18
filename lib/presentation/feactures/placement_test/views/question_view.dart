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
                  child: ListTile(
                    title: Text(option),
                    trailing: Radio<String>(
                      value: option,
                      groupValue: selectedAnswer,
                      onChanged: (value) => onOptionSelected(value!),
                    ),
                    onTap: () => onOptionSelected(option),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}