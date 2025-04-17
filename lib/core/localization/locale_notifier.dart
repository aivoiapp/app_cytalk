import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleNotifier extends ValueNotifier<Locale> {
  LocaleNotifier(Locale value) : super(value);

  Future<void> setLocale(Locale locale) async {
    value = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', locale.languageCode);
  }

  static Future<Locale> getInitialLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('preferred_language');
    
    if (savedLang != null) {
      return Locale(savedLang);
    }
    
    final systemLang = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    return Locale(systemLang == 'es' ? 'es' : 'en');
  }
}