import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cytall/presentation/resources/resources.dart';

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
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(24.0),
                // border: Border.all(color: AppColors.enabledBorder.withOpacity(0.2), width: 1), // Borde sutil opcional
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
