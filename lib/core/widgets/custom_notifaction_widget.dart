import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/notification/presentation/notification_view.dart';
import 'package:fruit_app/core/util/app_image.dart';

class CustomNotificationWidget extends StatelessWidget {
  const CustomNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NotificationView.routeName);
      },
      child: CircleAvatar(
        backgroundColor: const Color(0xFFEEF8ED),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
