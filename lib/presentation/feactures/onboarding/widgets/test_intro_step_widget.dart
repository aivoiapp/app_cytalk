import 'package:flutter/material.dart';
import 'package:cytall/presentation/resources/resources.dart';

class TestIntroStepWidget extends StatelessWidget {
  const TestIntroStepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.testIntroIconBackground,

          radius: 34,
          child: Icon(Icons.psychology_outlined, size: 48, color: Colors.red),
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
          colorICon: Colors.purple,
          title: "15 preguntas adaptativas",
          subtitle:
              "5 de gramática, 5 de comprensión lectora, 5 de vocabulario",
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          icon: Icons.timer_outlined,
          colorICon: Colors.red,

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
    required Color colorICon,
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
          CircleAvatar(
            radius: 19,
            backgroundColor: colorICon.withOpacity(0.2),
            child: Icon(icon, color: colorICon, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.label.copyWith(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
