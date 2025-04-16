import 'package:flutter/material.dart';

import 'presentation/feactures/onboarding/onboarding.dart';
import 'presentation/feactures/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: HomeScreen());
    // return MaterialApp(title: 'Material App', home: OnboardingScreen());
  }
}
