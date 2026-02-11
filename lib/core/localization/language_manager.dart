import 'package:flutter/material.dart';
import '../shared_preferences/prefs_keys.dart';
import '../shared_preferences/shared_prefs.dart';
import '../../app/di/injection_container.dart';

class LanguageManager extends ChangeNotifier {
  Locale _currentLocale = const Locale('ar'); // Default to Arabic
  
  Locale get currentLocale => _currentLocale;
  
  bool get isArabic => _currentLocale.languageCode == 'ar';
  bool get isEnglish => _currentLocale.languageCode == 'en';
  
  LanguageManager() {
    _loadSavedLanguage();
  }
  
  void _loadSavedLanguage() {
    final prefs = sl<SharedPrefs>();
    final savedLanguage = prefs.getString(key: PrefsKeys.languageCode);
    if (savedLanguage != null) {
      _currentLocale = Locale(savedLanguage);
    }
  }
  
  Future<void> changeLanguage(String languageCode) async {
    if (_currentLocale.languageCode != languageCode) {
      _currentLocale = Locale(languageCode);
      
      // Save to preferences
      final prefs = sl<SharedPrefs>();
      await prefs.saveString(key: PrefsKeys.languageCode, value: languageCode);
      
      notifyListeners();
    }
  }
  
  Future<void> toggleLanguage() async {
    final newLanguage = isArabic ? 'en' : 'ar';
    await changeLanguage(newLanguage);
  }
}