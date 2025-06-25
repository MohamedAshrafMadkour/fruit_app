import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColor.kPrimaryColor,
          child: Icon(Icons.check, size: 18, color: Colors.white),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: Styles.textBold13.copyWith(color: AppColor.kPrimaryColor),
        ),
      ],
    );
  }
}
