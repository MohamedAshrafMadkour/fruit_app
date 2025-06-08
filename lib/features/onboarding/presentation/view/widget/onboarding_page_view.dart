import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/onboarding/presentation/view/widget/custom_text_span.dart';
import 'package:fruit_app/features/onboarding/presentation/view/widget/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          background: Assets.imagesFirstOnboardingBackgroundMin,
          image: Assets.imagesFirstOnboardingImage,
          title: const CustomTextSpan(),
        ),
        PageViewItem(
          isVisible: false,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          background: Assets.imagesSecondOnboardingBackground,
          image: Assets.imagesSecondOnboardingImage,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: Styles.textBold23,
          ),
        ),
      ],
    );
  }
}
