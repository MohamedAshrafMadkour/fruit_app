import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_item_list.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_cart_button.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_cart_count_container.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(
                    context,
                    text: 'السلة',
                    isActionActive: false,
                    isChoice: false,
                  ),
                  const SizedBox(height: 16),
                  const CustomCartCountContainer(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<ItemCartCubit>().cartEntity.cartList.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
            CartItemList(
              cart: context.watch<ItemCartCubit>().cartEntity.cartList,
            ),
            SliverToBoxAdapter(
              child: context.read<ItemCartCubit>().cartEntity.cartList.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),
        const SizedBox(height: 50),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .07,
          child: const CustomCartButton(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
