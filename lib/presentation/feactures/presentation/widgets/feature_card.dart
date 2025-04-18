import 'package:flutter/material.dart';

import 'package:cytalk/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytalk/presentation/resources/resources.dart';

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.enabledBorder.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularIcon(
            icon: icon,
            backgroundColor: AppColors.deepPurple.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.primaryText,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.body.copyWith(
              color: AppColors.secondaryText,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
