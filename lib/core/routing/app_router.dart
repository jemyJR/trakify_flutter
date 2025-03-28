import 'package:flutter/material.dart';
import 'package:trakify/features/login/ui/login_screen.dart';
import 'package:trakify/features/onboarding/ui/onboarding_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    return null;
  }
}
