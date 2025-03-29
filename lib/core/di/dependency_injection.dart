import 'package:get_it/get_it.dart';

import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Register CacheHelper
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());

  // Initialize CacheHelper
  await getIt<CacheHelper>().init();
}
