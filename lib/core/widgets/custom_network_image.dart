import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.borderRadius,
  });
  final String imageUrl;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: imageUrl,
        placeholder: (context, url) => Skeletonizer(
          enabled: true,
          child: Skeletonizer(
            enabled: true,
            enableSwitchAnimation: true,
            ignorePointers: true,
            switchAnimationConfig: const SwitchAnimationConfig(
              switchOutCurve: Curves.bounceInOut,
            ),
            child: Container(
              height: MediaQuery.sizeOf(context).height * .13,
              width: MediaQuery.sizeOf(context).width * .31,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
