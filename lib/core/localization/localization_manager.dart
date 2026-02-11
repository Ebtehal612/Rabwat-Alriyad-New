import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/di/injection_container.dart';
import '../../app/route_manager/app_router.dart';
import 'app_localizations.dart';

AppLocalizations get lz =>
    AppLocalizations.of(sl<AppRouter>().navigatorKey.currentContext!)!;

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar'));

  void changeLocale(Locale locale) {
    emit(locale);
  }

  void toArabic() => emit(const Locale('ar'));
  void toEnglish() => emit(const Locale('en'));

  AppLocalizations get appLocalizations => lz;
}
