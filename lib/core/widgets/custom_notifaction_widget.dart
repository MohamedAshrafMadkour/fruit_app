import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/util/app_image.dart';

class CustomNotificationWidget extends StatelessWidget {
  const CustomNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: const Color(0xFFEEF8ED),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
