import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trakify/core/networking/api/api_consumer.dart';
import 'package:trakify/core/networking/api/dio_consumer.dart';
import 'package:trakify/core/widgets/loading_widget.dart';
import 'package:trakify/features/login/data/repos/login_repo.dart';
import 'package:trakify/features/login/logic/login_cubit.dart';
import 'package:trakify/features/profile/data/repo/profile_repo.dart';
import 'package:trakify/features/profile/logic/profile_cubit.dart';
import 'package:trakify/features/signup/data/repos/signup_repo.dart';
import 'package:trakify/features/signup/logic/cubit/signup_cubit.dart';

import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Initialize CacheHelper
  await getIt<CacheHelper>().init();

  // Register LoadingWidgetService
  getIt.registerLazySingleton<LoadingWidgetService>(
    () => LoadingWidgetService(),
  );

  // Register Dio and ApiConsumer
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: getIt<Dio>()),
  );

  // Register SignupCubit
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // Register LoginCubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Register ProfileCubit
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
}
