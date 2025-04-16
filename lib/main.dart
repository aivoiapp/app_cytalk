import 'package:flutter/material.dart';
import 'package:cytall/presentation/routes/app_router.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CyTalk',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
