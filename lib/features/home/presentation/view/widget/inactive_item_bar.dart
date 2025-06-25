import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InactiveItemBar extends StatelessWidget {
  const InactiveItemBar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 50,
      child: SvgPicture.asset(image, height: 20),
    );
  }
}
