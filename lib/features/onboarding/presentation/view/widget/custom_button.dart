import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/services/shared_prefs.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/Auth/presentation/view/login_view.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        minimumSize: const Size(double.infinity, 65),
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      onPressed: () {
        SharedPref.setBool(kSharedPref, true);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      },
      child: Text(
        'ابدأ الان',
        textAlign: TextAlign.center,
        style: Styles.textBold16,
      ),
    );
  }
}
