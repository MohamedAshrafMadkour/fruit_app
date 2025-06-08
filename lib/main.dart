import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_app/core/helper/on_generate_route.dart';
import 'package:fruit_app/core/services/shared_prefs.dart';
import 'package:fruit_app/features/splash/presentation/view/splash_view.dart';
import 'package:fruit_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      initialRoute: SplashView.routeName,
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
