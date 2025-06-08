import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    executionNavigation().then(
      (value) =>
          Navigator.pushReplacementNamed(context, OnboardingView.routeName),
    );
    super.initState();
  }

  Future<dynamic> executionNavigation() =>
      Future.delayed(const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        SvgPicture.asset(Assets.imagesPlant),
        Center(child: SvgPicture.asset(Assets.imagesFruitLabel)),
        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }
}
