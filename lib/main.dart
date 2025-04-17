import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:cytalk/presentation/routes/app_router.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = WidgetsBinding.instance.platformDispatcher.locale;


  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  void _initializeLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('preferred_language');

    if (savedLang != null) {
      setState(() {
        _locale = Locale(savedLang);
      });
    } else {
      // If no saved value, use the system language
      final deviceLang = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      setState(() {
        _locale = Locale(deviceLang == 'es' ? 'es' : 'en');
      });
    }
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CyTalk',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      locale: _locale,
    );
  }
}
