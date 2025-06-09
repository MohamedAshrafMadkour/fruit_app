import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_login_list_tile.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/dont_have_any_account.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/or_divider.dart';
import 'package:fruit_app/features/onboarding/presentation/view/widget/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
            ), //CustomButton(title: 'تسجيل دخول'),
            SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              icon: Icon(Icons.remove_red_eye),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: Styles.textSemiBold13.copyWith(
                    color: AppColor.kLightPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 33),
            CustomButton(title: 'تسجيل دخول'),
            SizedBox(height: 33),
            DontHaveAnyAccount(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 16),
            CustomLoginListTile(
              image: Assets.imagesGoogleIcon,
              title: 'تسجيل بواسطة جوجل',
            ),
            SizedBox(height: 16),
            CustomLoginListTile(
              image: Assets.imagesIphoneIcon,
              title: 'تسجيل بواسطة أبل',
            ),
            SizedBox(height: 16),
            CustomLoginListTile(
              image: Assets.imagesFacebook,
              title: 'تسجيل بواسطة فيسبوك',
            ),
          ],
        ),
      ),
    );
  }
}
