import 'package:flutter/material.dart';
import 'package:cytall/presentation/feactures/presentation/widgets/widgets.dart';

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
          children: const [
            HeroSection(),

            SizedBox(height: 32),

            FeatureCard(
              icon: Icons.menu_book_outlined,
              title: 'Práctica Offline',
              description:
                  'Accede a tus ejercicios sin conexión, con almacenamiento local en tu dispositivo',
            ),
            FeatureCard(
              icon: Icons.bolt_outlined,
              title: 'Gamificación',
              description:
                  'Mantente motivado con puntos, insignias y un sistema de niveles progresivo',
            ),

            SizedBox(height: 24),
            LevelTestCard(),
          ],
        ),
      ),
    );
  }
}
