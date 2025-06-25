import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_item.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_divider.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cart});
  final List<CartItemEntity> cart;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cart[index]);
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
    );
  }
}
