import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trakify/core/di/dependency_injection.dart';
import 'package:trakify/core/routing/app_router.dart';
import 'package:trakify/core/routing/initial_route_manager.dart';
import 'package:trakify/trakify_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  String initialRoute = await InitialRouteManager.determineInitialRoute();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  runApp(TrakifyApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
