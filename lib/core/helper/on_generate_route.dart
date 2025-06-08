import 'package:flutter/material.dart';
import 'package:fruit_app/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(dynamic settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashView());
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
