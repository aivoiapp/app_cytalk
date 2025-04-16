import 'package:flutter/material.dart';
import 'package:cytall/presentation/resources/resources.dart';

class TestIntroStepWidget extends StatelessWidget {
  const TestIntroStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.psychology_outlined, size: 48, color: AppColors.iconColor),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.testIntroIconBackground,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.psychology_outlined,
            size: 48,
            color: AppColors.iconColor,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Prueba de Nivel",
          style: AppTextStyles.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Vamos a determinar tu nivel de inglés con una prueba adaptativa",
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildInfoItem(
          icon: Icons.check_circle_outline,
          title: "15 preguntas adaptativas",
          subtitle:
              "5 de gramática, 5 de comprensión lectora, 5 de vocabulario",
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          icon: Icons.auto_awesome_outlined, // Icono de IA
          title: "Inteligencia artificial",
          subtitle: "Dificultad ajustada según tus respuestas anteriores",
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          icon: Icons.timer_outlined,
          title: "Tiempo limitado",
          subtitle: "30 segundos por pregunta para evaluar tu fluidez",
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.inputFill, // Reutilizamos el color de fondo del input
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.enabledBorder.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.iconColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.label.copyWith(fontSize: 15),
                ), // Un poco más pequeño
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
