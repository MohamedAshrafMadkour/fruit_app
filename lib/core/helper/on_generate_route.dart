import 'package:flutter/material.dart';
import 'package:fruit_app/features/Auth/presentation/view/login_view.dart';
import 'package:fruit_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:fruit_app/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(dynamic settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (_) => OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => LoginView());
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
