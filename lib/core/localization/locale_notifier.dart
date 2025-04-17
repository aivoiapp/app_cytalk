import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends ValueNotifier<Locale> {
  LocaleNotifier(Locale value) : super(value);

  Future<void> setLocale(Locale locale) async {
    super.value = locale; // Use super.value to trigger notifications
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', locale.languageCode);
  }

  static Future<Locale> getInitialLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('preferred_language');
    
    if (savedLang != null && savedLang.isNotEmpty) {
      return Locale(savedLang);
    }

    final systemLocales = WidgetsBinding.instance.platformDispatcher.locales;
    const supported = ['en', 'es'];
    
    // Buscar coincidencia exacta en todos los idiomas del sistema
    for (final locale in systemLocales) {
      final lang = locale.languageCode.toLowerCase();
      if (supported.contains(lang)) {
        return Locale(lang);
      }
    }
    
    // Si ningún idioma coincide, usar inglés como fallback
    return const Locale('en');
  }
}