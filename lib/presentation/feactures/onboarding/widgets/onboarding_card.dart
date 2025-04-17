import 'dart:ui';
import 'package:cytalk/presentation/resources/colors.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final Widget child;

  const OnboardingCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 32.0,
                horizontal: 24.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryPurple.withOpacity(0.4),
                    AppColors.deepPurple.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3), // Borde blanco similar
                  width: 1.5, // Ajusta el grosor del borde
                ),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
