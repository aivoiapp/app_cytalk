import 'package:flutter/material.dart';

import 'package:cytalk/presentation/feactures/presentation/views/views.dart';
import 'package:cytalk/presentation/feactures/presentation/widgets/widgets.dart';
import 'package:cytalk/presentation/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppHeader(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundGradientStart,
              AppColors.backgroundGradientEnd,
              AppColors.backgroundGradientStart,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const SafeArea(top: true, bottom: false, child: HomeView()),
      ),
    );
  }
}
