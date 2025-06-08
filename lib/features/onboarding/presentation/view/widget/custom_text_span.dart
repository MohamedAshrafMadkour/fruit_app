import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'مرحبًا بك في',
            style: Styles.textBold23.copyWith(color: const Color(0xFF0C0D0D)),
          ),
          TextSpan(
            text: ' Fruit',
            style: Styles.textBold23.copyWith(color: const Color(0xFF1B5E37)),
          ),
          TextSpan(
            text: 'HUB',
            style: Styles.textBold23.copyWith(color: const Color(0xFFF4A91F)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
