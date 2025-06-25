import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/services/shared_pref.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/features/onboarding/presentation/view/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executionNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        SvgPicture.asset(Assets.imagesFruitLabel),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void executionNavigation() {
    bool isOnboarding = SharedPref.getBool(kSharedPref);
    Future.delayed(const Duration(seconds: 3), () {
      // if (isOnboarding) {
      //   var isLoggedIn = AuthService().isLoggedIn();
      //   if (isLoggedIn) {
      //     Navigator.pushReplacementNamed(context, MainView.routeName);
      //   } else {
      //     Navigator.pushReplacementNamed(context, LoginView.routeName);
      //   }
      // } else {
      //   Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      // }
      Navigator.pushReplacementNamed(context, OnboardingView.routeName);
    });
  }
}
