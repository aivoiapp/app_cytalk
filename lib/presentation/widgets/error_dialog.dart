import 'package:flutter/material.dart';
import 'package:cytalk/presentation/resources/resources.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const ErrorDialog({
    super.key,
    required this.message,
    this.buttonText = 'Entendido',
    this.onButtonPressed,
  });

  static void show(BuildContext context, String errorMessage) {
    // Eliminar 'Exception: ' del mensaje si existe
    final cleanMessage = errorMessage.replaceAll('Exception: ', '');
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ErrorDialog(message: cleanMessage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: AppColors.cardBackground,
      titleTextStyle: AppTextStyles.headlineMedium.copyWith(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20, // Tamaño más pequeño para el título del diálogo
      ),
      contentTextStyle: AppTextStyles.body.copyWith(
        color: AppColors.secondaryText,
      ),
      actions: [
        TextButton(
          onPressed: onButtonPressed ?? () => Navigator.of(context).pop(),
          child: Text(
            buttonText,
            style: TextStyle(color: AppColors.buttonGradientEnd),
          ),
        ),
      ],
    );
  }
}