import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_app/features/home/presentation/view/widget/active_item_bar.dart';
import 'package:fruit_app/features/home/presentation/view/widget/inactive_item_bar.dart';

class ActiveAndInactiveItemBar extends StatelessWidget {
  const ActiveAndInactiveItemBar({
    super.key,
    required this.isActive,
    required this.bottomNavBarItems,
  });
  final bool isActive;
  final BottomNavBarEntity bottomNavBarItems;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItemBar(
            image: bottomNavBarItems.activeImage,
            text: bottomNavBarItems.name,
          )
        : InactiveItemBar(image: bottomNavBarItems.inactiveImage);
  }
}
