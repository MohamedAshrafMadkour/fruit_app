import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
  return AppBar(
    centerTitle: true,

    scrolledUnderElevation: 0,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_outlined, size: 20),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title, textAlign: TextAlign.center, style: Styles.textBold19),
  );
}
