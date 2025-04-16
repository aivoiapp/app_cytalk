import 'package:flutter/material.dart';
import 'package:cytall/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytall/presentation/resources/resources.dart';

class LevelTestCard extends StatelessWidget {
  const LevelTestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryPurple.withOpacity(0.4),
            AppColors.deepPurple.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.enabledBorder.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Círculo "A2"
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.lightBlueAccent, width: 3),
            ),
            child: Text(
              'A2',
              style: AppTextStyles.headlineLarge.copyWith(
                color: Colors.lightBlueAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Descubre tu nivel real de inglés',
            textAlign: TextAlign.center,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primaryText,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Nuestro test de nivel adaptativo utiliza inteligencia artificial para determinar con precisión tu nivel actual y ofrecerte ejercicios personalizados para mejorar rápidamente.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              color: AppColors.secondaryText,
              fontSize: 15,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: 'Realizar test de nivel',
            iconData: Icons.arrow_forward,
            onPressed: () {
              print('Realizar test presionado');
            },
          ),
        ],
      ),
    );
  }
}
