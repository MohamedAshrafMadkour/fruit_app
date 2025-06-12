import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_password_field.dart';
import 'package:fruit_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_login_list_tile.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/dont_have_any_account.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/or_divider.dart';
import 'package:fruit_app/features/home/presentation/view/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value;
                },
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
              CustomSignButton(
                title: 'تسجيل دخول',
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   formKey.currentState!.save();
                  //   context.read<LoginCubit>().loginInEmailAndPassword(
                  //     email: email!,
                  //     password: password!,
                  //   );
                  // } else {
                  //   autovalidateMode = AutovalidateMode.always;
                  //   setState(() {});
                  // }
                  Navigator.pushNamed(context, HomeView.routeName);
                },
              ),
              SizedBox(height: 33),
              DontHaveAnyAccount(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              CustomLoginListTile(
                onTap: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
                image: Assets.imagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              SizedBox(height: 16),
              CustomLoginListTile(
                onTap: () {
                  context.read<LoginCubit>().loginWithApple();
                },
                image: Assets.imagesIphoneIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              SizedBox(height: 16),
              CustomLoginListTile(
                onTap: () {
                  context.read<LoginCubit>().loginWithFacebook();
                },
                image: Assets.imagesFacebook,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
