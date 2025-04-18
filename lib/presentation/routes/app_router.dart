import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cytalk/presentation/feactures/presentation/screens/home_screen.dart';
import 'package:cytalk/presentation/feactures/onboarding/onboarding.dart';
import 'package:cytalk/presentation/feactures/splash/splash.dart';
import 'package:cytalk/presentation/features/placement_test/widgets/result_loader.dart';

class AppRoutes {
  static const String splash = '/'; // Ruta raíz
  static const String onboarding = '/onboarding';
  static const String presentation = '/presentation';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,

    // --- Definición de las rutas ---
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.presentation,
        name: AppRoutes.presentation,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        name: AppRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/result_loader',
        name: 'result_loader',
        builder: (BuildContext context, GoRouterState state) {
          return const ResultLoader();
        },
      ),
    ],

    // --- Manejo de Errores  ---
    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: Text(AppLocalizations.of(context)!.notFound)),
          body: Center(
            child: Text(
              'Error: ${state.error?.message ?? 'Ruta no encontrada'}',
            ),
          ),
        ),
  );
}
