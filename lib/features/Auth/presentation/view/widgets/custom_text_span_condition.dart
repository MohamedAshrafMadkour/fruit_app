import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomTextSpanConditions extends StatelessWidget {
  const CustomTextSpanConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'من خلال إنشاء حساب ، فإنك توافق على ',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            text: 'الشروط والأحكام',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF2D9F5D),
            ),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            text: 'الخاصة',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF2D9F5D),
            ),
          ),
          TextSpan(
            text: ' ',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            text: 'بنا',
            style: Styles.textSemiBold13.copyWith(
              color: const Color(0xFF2D9F5D),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}
