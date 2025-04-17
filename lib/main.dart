import 'package:cytalk/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:cytalk/presentation/routes/app_router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cytalk/core/localization/locale_notifier.dart';

late final LocaleNotifier localeNotifier;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final initialLocale = await LocaleNotifier.getInitialLocale();
  localeNotifier = LocaleNotifier(initialLocale);

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
          locale: locale,
        );
      },
    );
  }
}
