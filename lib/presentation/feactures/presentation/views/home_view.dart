import 'package:flutter/material.dart';
import 'package:cytalk/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytalk/l10n/app_localizations.dart'; // Import AppLocalizations

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ).copyWith(top: 16.0, bottom: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeroSection(),

            const SizedBox(height: 32),
            
            FeatureCard(
              icon: Icons.bolt_outlined,
              title: AppLocalizations.of(context).gamificationTitle, 
              description: AppLocalizations.of(context).gamificationDescription, 
            ),

            const SizedBox(height: 24),
            const LevelTestCard(),
          ],
        ),
      ),
    );
  }
}
