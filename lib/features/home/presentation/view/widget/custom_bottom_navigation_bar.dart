import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/domain/entities/bottom_nav_bar_entity.dart';
import 'package:fruit_app/features/home/presentation/view/widget/active_and_inactive_item_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: bottomNavBarItems.asMap().entries.map((e) {
            int index = e.key;
            return Expanded(
              flex: currentIndex == e.key ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    widget.onItemTapped(index);
                  });
                },
                child: ActiveAndInactiveItemBar(
                  isActive: currentIndex == index,
                  bottomNavBarItems: e.value,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
