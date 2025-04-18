import 'package:flutter/material.dart';
import 'package:cytalk/presentation/resources/resources.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? iconData; // Opcional: para el icono de flecha

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryPurple,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyles.button.copyWith(
              color: AppColors.primaryPurple,
              fontSize: 16,
            ),
          ),
          if (iconData != null) ...[
            const SizedBox(width: 8),
            Icon(iconData, size: 20),
          ],
        ],
      ),
    );
  }
}
