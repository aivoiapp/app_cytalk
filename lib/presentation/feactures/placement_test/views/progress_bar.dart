import 'package:cytalk/presentation/resources/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressBar({super.key, required this.currentStep, required this.totalSteps});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: currentStep / totalSteps,
      backgroundColor: AppColors.backgroundGradientStart.withOpacity(0.3), // Adjusted transparency
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonGradientEnd),
    );
  }
}