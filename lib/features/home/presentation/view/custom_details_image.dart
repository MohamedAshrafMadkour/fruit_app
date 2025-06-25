import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/widgets/custom_network_image.dart';

class CustomDetailsImage extends StatelessWidget {
  const CustomDetailsImage({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .45,
      child: Stack(
        children: [
          Positioned.fill(
            left: 0,
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              Assets.imagesDetailsShape,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 50,
            right: 15,
            child: Container(
              width: 44,
              height: 44,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Color(0xFFF1F1F5)),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_outlined),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .20,
              width: MediaQuery.sizeOf(context).width * .5,
              child: CustomNetworkImage(
                borderRadius: BorderRadius.circular(8),
                imageUrl: productEntity.imageUrl ?? " ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
