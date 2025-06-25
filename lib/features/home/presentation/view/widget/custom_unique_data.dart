import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomUniqueData extends StatelessWidget {
  const CustomUniqueData({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .43,

      padding: const EdgeInsets.only(top: 12, left: 16, right: 8, bottom: 12),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF1F1F5)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              FittedBox(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: Styles.textBold16.copyWith(
                    color: AppColor.kLightPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              FittedBox(
                child: Text(
                  subtitle,
                  textAlign: TextAlign.right,
                  style: Styles.textSemiBold13.copyWith(
                    color: AppColor.kLightPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFF1F1F5)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              ' $title days',
              style: Styles.textSemiBold13.copyWith(
                color: AppColor.kLightPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
