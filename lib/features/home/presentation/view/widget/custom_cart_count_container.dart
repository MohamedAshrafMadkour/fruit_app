import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';

class CustomCartCountContainer extends StatelessWidget {
  const CustomCartCountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      child: Center(
        child: Text(
          'لديك ${context.watch<ItemCartCubit>().cartEntity.cartList.length} منتجات في سله التسوق',
          style: Styles.textRegular13.copyWith(color: const Color(0xFF1B5E37)),
        ),
      ),
    );
  }
}
