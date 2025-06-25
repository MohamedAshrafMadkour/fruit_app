import 'package:flutter/material.dart';
import 'package:fruit_app/core/helper/get_user.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_notifaction_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: const Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: Styles.textRegular16,
      ),
      subtitle: Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: Styles.textBold16.copyWith(color: Colors.black),
      ),
      trailing: const CustomNotificationWidget(),
    );
  }
}
