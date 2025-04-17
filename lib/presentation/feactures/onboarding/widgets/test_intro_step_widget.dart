import 'package:flutter/material.dart';
import 'package:cytalk/presentation/resources/resources.dart';
import 'package:cytalk/l10n/app_localizations.dart'; // Import AppLocalizations

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
          AppLocalizations.of(context).testIntroTitle, // Use localized text
          style: AppTextStyles.headlineMedium.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          AppLocalizations.of(context).testIntroDescription, // Use localized text
          style: AppTextStyles.subtitle.copyWith(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        _buildInfoItem(
          icon: Icons.check_circle_outline,
          colorICon: Colors.purple,
          title: AppLocalizations.of(context).adaptiveQuestionsTitle, // Use localized text
          subtitle: AppLocalizations.of(context).adaptiveQuestionsSubtitle, // Use localized text
        ),
        const SizedBox(height: 16),
        _buildInfoItem(
          icon: Icons.timer_outlined,
          colorICon: Colors.red,
          title: AppLocalizations.of(context).limitedTimeTitle, // Use localized text
          subtitle: AppLocalizations.of(context).limitedTimeSubtitle, // Use localized text
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
        color: AppColors.inputFill,
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
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyles.body.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
