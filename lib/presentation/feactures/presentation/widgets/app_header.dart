import 'package:flutter/material.dart';

import 'package:cytall/presentation/resources/resources.dart';

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
              'CyTalk',
              style: AppTextStyles.headlineMedium.copyWith(
                fontSize: 20,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
