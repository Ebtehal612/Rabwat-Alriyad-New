import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:rabwat_alriyad_new/core/cubits/additions_cubit.dart';
import 'package:rabwat_alriyad_new/core/cubits/cart_cubit.dart';
import 'package:rabwat_alriyad_new/core/cubits/user_cubit.dart';
import 'package:rabwat_alriyad_new/core/localization/app_localizations.dart';
import 'package:rabwat_alriyad_new/core/localization/language_manager.dart';
import 'package:rabwat_alriyad_new/core/localization/localization_manager.dart';
import 'package:rabwat_alriyad_new/core/theme/app_theme.dart';
import 'di/injection_container.dart';
import 'route_manager/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider.value(value: sl<LocaleCubit>()),
        BlocProvider.value(value: sl<UserCubit>()),
        BlocProvider.value(value: sl<AdditionsCubit>()),
        BlocProvider.value(value: sl<CartCubit>()),
        ChangeNotifierProvider.value(value: sl<LanguageManager>()),
      ],
      child: Consumer<LanguageManager>(
        builder: (context, languageManager, child) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, state) {
              return ScreenUtilInit(
                minTextAdapt: true,
                splitScreenMode: true,
                designSize: const Size(393, 852),
                builder: (context, child) => ToastificationConfigProvider(
                  config: const ToastificationConfig(),
                  child: MaterialApp.router(
                    key: ValueKey<String>(languageManager.currentLocale.languageCode),
                    debugShowCheckedModeBanner: false,
                    title: 'Rabwat Alriyad',
                    theme: sl<AppTheme>().theme,
                    routerConfig: sl<AppRouter>().router,
                    locale: languageManager.currentLocale,
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
