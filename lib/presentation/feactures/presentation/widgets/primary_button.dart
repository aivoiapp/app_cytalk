import 'package:flutter/material.dart';
import 'package:cytall/presentation/resources/resources.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? iconData; // Opcional

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.buttonGradientStart, AppColors.buttonGradientEnd],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Material(
        // Para el efecto ripple
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: AppTextStyles.button,
                  textAlign: TextAlign.center,
                ),
                if (iconData != null) ...[
                  const SizedBox(width: 8),
                  Icon(iconData, color: AppColors.primaryText, size: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
