import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_notifaction_widget.dart';

AppBar buildAppBar(
  BuildContext context, {
  bool isChoice = true,
  bool isActionActive = true,
  required String text,
  void Function()? onPressed,
}) {
  return AppBar(
    leading: Visibility(
      visible: isChoice,
      child: Center(
        child: Container(
          width: 44,
          height: 44,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: OvalBorder(
              side: BorderSide(width: 1, color: Color.fromARGB(255, 5, 5, 18)),
            ),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
        ),
      ),
    ),
    actions: [
      Visibility(
        visible: isActionActive,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomNotificationWidget(),
        ),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    title: Text(text, textAlign: TextAlign.center, style: Styles.textBold19),
  );
}
