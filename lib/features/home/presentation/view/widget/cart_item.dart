import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_network_image.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/manager/update_cubit/update_item_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateItemCubit, UpdateItemState>(
      buildWhen: (previous, current) {
        if (current is UpdateItemSuccess) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 78 / 85,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.sizeOf(context).width * .2,
                    height: MediaQuery.sizeOf(context).height * .13,
                    decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                    child: CustomNetworkImage(
                      imageUrl: cartItemEntity.product.imageUrl ?? " ",
                    ),
                  ),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            cartItemEntity.product.name,
                            style: Styles.textBold13,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              context.read<ItemCartCubit>().removeItem(
                                cartItemEntity,
                              );
                            },
                            child: SvgPicture.asset(Assets.imagesTrash),
                          ),
                        ],
                      ),
                      Text(
                        '${cartItemEntity.calculateTotalWeight()} كم',
                        textAlign: TextAlign.right,
                        style: Styles.textRegular13.copyWith(
                          color: AppColor.kSecondaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          CartItemActionButtons(cartItemEntity: cartItemEntity),
                          const Spacer(),
                          Text(
                            '${cartItemEntity.calculateTotalPrice()} جنيه ',
                            style: Styles.textBold16.copyWith(
                              color: AppColor.kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
