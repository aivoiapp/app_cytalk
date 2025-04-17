import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends ValueNotifier<Locale> {
  LocaleNotifier(Locale value) : super(value);

  static Future<Locale> getInitialLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('preferred_language');
    final systemLocales = WidgetsBinding.instance.platformDispatcher.locales;
    const supported = ['en', 'es'];
    // Si el usuario ha seleccionado manualmente un idioma, usarlo
    if (savedLang != null && savedLang.isNotEmpty && prefs.getBool('user_selected_language') == true) {
      return Locale(savedLang);
    }
    // Si no, usar el idioma del sistema si está soportado
    for (final locale in systemLocales) {
      final lang = locale.languageCode.toLowerCase();
      if (supported.contains(lang)) {
        return Locale(lang);
      }
    }
    // Si ningún idioma coincide, usar inglés como fallback
    return const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    super.value = locale; // Use super.value to trigger notifications
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', locale.languageCode);
    await prefs.setBool('user_selected_language', true);
  }
}