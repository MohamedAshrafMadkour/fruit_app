import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/app_color.dart';

void showBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(6),
        side: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
      content: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        trailing: IconButton(
          color: AppColor.kLightPrimaryColor,
          onPressed: () {},
          icon: Icon(Icons.error),
        ),
        title: Text(
          message,
          style: TextStyle(color: AppColor.kLightPrimaryColor),
        ),
      ),
    ),
  );
}
