import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cytall/presentation/feactures/presentation/screens/home_screen.dart';
import 'package:cytall/presentation/feactures/onboarding/onboarding.dart';
import 'package:cytall/presentation/feactures/splash/splash.dart';

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
    ],

    // --- Manejo de Errores  ---
    errorBuilder:
        (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Página no encontrada')),
          body: Center(
            child: Text(
              'Error: ${state.error?.message ?? 'Ruta no encontrada'}',
            ),
          ),
        ),
  );
}
