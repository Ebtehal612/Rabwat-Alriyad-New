
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' as flp;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:rabwat_alriyad_new/core/cubits/additions_cubit.dart';
import 'package:rabwat_alriyad_new/core/cubits/user_cubit.dart';
import 'package:rabwat_alriyad_new/core/localization/language_manager.dart';
import 'package:rabwat_alriyad_new/core/localization/localization_manager.dart' show LocaleCubit;
import 'package:rabwat_alriyad_new/core/network/network_setup.dart' show createDio;
import 'package:rabwat_alriyad_new/core/shared_preferences/shared_prefs.dart';
import 'package:rabwat_alriyad_new/core/theme/app_theme.dart';
import 'package:rabwat_alriyad_new/core/utils/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../route_manager/app_router.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // External
  await flp.init();
  final saCountry = (await flp.getAllSupportedRegions())['SA']!;
  sl.registerSingleton<flp.CountryWithPhoneCode>(saCountry);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => createDio());

  // Core
  sl.registerLazySingleton<SharedPrefs>(() => SharedPrefs(sl(), sl()));
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
  sl.registerLazySingleton<LanguageManager>(() => LanguageManager());
  sl.registerLazySingleton<Validators>(() => Validators());

  // Data Sources
  //sl.registerLazySingleton<ProfileRemoteDataSource>(
  //() => ProfileRemoteDataSourceImpl(sl()));

  // Repositories
  //sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(remoteDataSource: sl()));

  // Use Cases
  //sl.registerLazySingleton(() => GetProfileUseCase(sl()));

  // Cubits
  sl.registerLazySingleton<UserCubit>(() => UserCubit(sl()));
  sl.registerLazySingleton<AdditionsCubit>(() => AdditionsCubit());
  //sl.registerLazySingleton(() => ProfileCubit(sl()));
}
