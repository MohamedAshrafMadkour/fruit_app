import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/manager/update_cubit/update_item_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_item_action_button.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          iconColor: Colors.white,
          icon: Icons.add,
          color: AppColor.kPrimaryColor,
          onPressed: () {
            cartItemEntity.increaseQuantity();
            context.read<UpdateItemCubit>().updateItem(cartItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${cartItemEntity.quantity}',
            textAlign: TextAlign.center,
            style: Styles.textBold16.copyWith(color: const Color(0xFF0C0D0D)),
          ),
        ),
        CartItemActionButton(
          iconColor: Colors.grey,
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseQuantity();
            context.read<UpdateItemCubit>().updateItem(cartItemEntity);
          },
        ),
      ],
    );
  }
}
