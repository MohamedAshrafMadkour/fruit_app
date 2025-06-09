import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/features/onboarding/presentation/view/widget/custom_button.dart';
import 'package:fruit_app/features/onboarding/presentation/view/widget/onboarding_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnboardingPageView(pageController: pageController)),
        DotsIndicator(
          fadeOutDistance: 1,
          animate: true,
          position: currentPage.toDouble(),
          onTap: (position) {
            pageController.jumpToPage(position);
          },
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: AppColor.kPrimaryColor,
            color: Color.fromRGBO(31, 94, 59, .5),
          ),
        ),
        SizedBox(height: 26),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(title: 'ابدأ الان'),
          ),
        ),
        SizedBox(height: 56),
      ],
    );
  }
}
