import 'package:flutter/material.dart';

import 'package:cytall/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytall/presentation/resources/resources.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: AppTextStyles.headlineLarge.copyWith(
                color: AppColors.primaryText,
                fontSize: 36, // Ligeramente más grande para impacto móvil
                height: 1.2,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Aprende inglés de forma '),
                TextSpan(
                  text: 'inteligente',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Prácticas personalizadas con IA que se adaptan a tu nivel y necesidades específicas',
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              color: AppColors.secondaryText.withOpacity(0.9),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          SecondaryButton(
            text: 'Comenzar ahora',
            iconData: Icons.arrow_forward,
            onPressed: () {
              // TODO: Implementar acción del botón
              print('Comenzar ahora presionado');
            },
          ),
        ],
      ),
    );
  }
}
