import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/best_selling/presentation/view/best_selling_view.dart';

class CustomSellingHeader extends StatelessWidget {
  const CustomSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: Styles.textBold16.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: Styles.textRegular13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
