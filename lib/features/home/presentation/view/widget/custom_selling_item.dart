import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_network_image.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/details_view.dart';

class CustomSellingItem extends StatelessWidget {
  const CustomSellingItem({
    super.key,
    required this.productEntity,
    this.isLoading = true,
  });
  final ProductEntity productEntity;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsView.routeName,
          arguments: productEntity,
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFFF3F5F7),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_outline),
              ),
            ),
            Positioned.fill(
              top: 5,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .13,
                    width: MediaQuery.sizeOf(context).width * .31,
                    child: CustomNetworkImage(
                      imageUrl:
                          productEntity.imageUrl ??
                          "https://thumb.ac-illust.com/b1/b170870007dfa419295d949814474ab2_w.jpeg",
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    title: Text(
                      productEntity.name,
                      textAlign: TextAlign.right,
                      style: Styles.textSemiBold16,
                    ),
                    subtitle: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${productEntity.price}جنية ',
                            style: Styles.textBold13.copyWith(
                              color: AppColor.kSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '/',
                            style: Styles.textBold13.copyWith(
                              color: AppColor.kLightSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: Styles.textSemiBold13.copyWith(
                              color: AppColor.kSecondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: 'كيلو',
                            style: Styles.textSemiBold13.copyWith(
                              color: AppColor.kLightSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    trailing: Visibility(
                      visible: isLoading,
                      child: GestureDetector(
                        onTap: () {
                          context.read<ItemCartCubit>().addItemToCart(
                            productEntity,
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColor.kPrimaryColor,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
