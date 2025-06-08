import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/services/shared_prefs.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/Auth/presentation/view/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.background,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });
  final String image, background, subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(background, fit: BoxFit.fill),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: SvgPicture.asset(image),
              ),
              SafeArea(
                child: Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: GestureDetector(
                      onTap: () {
                        SharedPref.setBool(kSharedPref, true);
                        Navigator.pushReplacementNamed(
                          context,
                          LoginView.routeName,
                        );
                      },
                      child: Text(
                        'تخط',
                        textAlign: TextAlign.center,
                        style: Styles.textRegular13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Styles.textSemiBold13,
          ),
        ),
      ],
    );
  }
}
