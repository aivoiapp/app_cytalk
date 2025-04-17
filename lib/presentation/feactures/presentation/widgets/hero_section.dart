import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:cytalk/presentation/routes/app_router.dart' show AppRoutes;

import 'package:cytalk/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytalk/presentation/resources/resources.dart';
import 'package:go_router/go_router.dart';

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
                fontSize: 36,
                height: 1.2,
              ),
              children: <TextSpan>[
                TextSpan(text: AppLocalizations.of(context).mainHeadline),
                TextSpan(
                  text: AppLocalizations.of(context).intelligently,
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
            AppLocalizations.of(context).practiceHeadline,
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              color: AppColors.secondaryText.withOpacity(0.9),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          SecondaryButton(
            text: AppLocalizations.of(context).startNow, // Use localized text
            iconData: Icons.arrow_forward,
            onPressed: () {
              context.pushNamed(AppRoutes.onboarding);
            },
          ),
        ],
      ),
    );
  }
}
