import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomLoginListTile extends StatelessWidget {
  const CustomLoginListTile({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });
  final String title, image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(width: 1, color: Color(0xFFDCDEDE)),
        ),

        leading: SvgPicture.asset(image),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.textSemiBold16.copyWith(color: const Color(0xFF0C0D0D)),
        ),
      ),
    );
  }
}
