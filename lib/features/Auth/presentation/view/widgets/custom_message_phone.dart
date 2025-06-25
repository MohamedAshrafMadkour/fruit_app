import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomMessagePhone extends StatelessWidget {
  const CustomMessagePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'أدخل الرمز الذي أرسلناه إلى هاتفك ',
          textAlign: TextAlign.right,
          style: Styles.textSemiBold16.copyWith(color: const Color(0xFF616A6B)),
        ),
      ],
    );
  }
}
