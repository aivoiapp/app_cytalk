import 'package:cytall/presentation/feactures/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cytall/presentation/feactures/onboarding/onboarding.dart';

class AppRoutes {
  static const String home = '/'; // Ruta raíz
  static const String onboarding = '/onboarding';
  static const String presentation = '/presentation';
}

class AppRouter {
  static final GoRouter router = GoRouter(
    // Ruta inicial de la aplicación
    initialLocation: AppRoutes.home,

    // --- Definición de las rutas ---
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
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
        path: AppRoutes.presentation,
        name: AppRoutes.presentation,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
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
