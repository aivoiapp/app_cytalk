import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:cytalk/presentation/routes/app_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cytalk/core/localization/locale_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

late final LocaleNotifier localeNotifier;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final prefs = await SharedPreferences.getInstance();
  final initialLocale = await LocaleNotifier.getInitialLocale();
  
  debugPrint('''
Idioma detectado: 
- Guardado: ${prefs.getString('preferred_language')}
- Sistema: ${WidgetsBinding.instance.platformDispatcher.locales}
- Seleccionado: $initialLocale
''');
  
  localeNotifier = LocaleNotifier(initialLocale);

  // Initialize Google Fonts first
  await GoogleFonts.pendingFonts([GoogleFonts.poppins()]);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (context, locale, _) {
        return MaterialApp.router(
          title: 'CyTalk',
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          locale: locale, // Asegurar que usa el locale actualizado
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English (no region)
            Locale('es'), // Spanish (no region)
          ],
        );
      },
    );
  }
}



// Remove the _precacheFonts() function entirely
