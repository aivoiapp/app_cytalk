import 'package:flutter/material.dart';

import 'package:cytalk/presentation/resources/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cytalk/main.dart';
import 'package:cytalk/l10n/app_localizations.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSignInPressed;

  const AppHeader({super.key, this.onSignInPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo.png', width: 30, height: 30),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context).title,
              style: AppTextStyles.headlineMedium.copyWith(
                fontSize: 20,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
      actions: [
        _buildLanguageSelector(context),
      ],
    );
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return FutureBuilder<String>(
      future: _getPreferredLanguage(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: snapshot.data,
            underline: Container(),
            icon: const Icon(Icons.language),
            items: [
              DropdownMenuItem(
                value: 'es',
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/es.svg', width: 24),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context).languageEs),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'en',
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/en.svg', width: 24),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context).languageEn),
                  ],
                ),
              ),
            ],
            onChanged: (String? newValue) async {
              if (newValue != null) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('preferred_language', newValue);
                MyApp.of(context).setLocale(Locale(newValue, ''));
              }
            },
          ),
        );
      },
    );
  }

  Future<String> _getPreferredLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('preferred_language') ?? 'en';
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Add preferredSize implementation
}
