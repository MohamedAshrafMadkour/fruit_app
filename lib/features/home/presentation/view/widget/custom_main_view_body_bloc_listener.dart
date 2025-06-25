import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/cart_view.dart';
import 'package:fruit_app/features/home/presentation/view/home_view.dart';
import 'package:fruit_app/features/home/presentation/view/products_view.dart';

class CustomMainViewBodyBlocListener extends StatelessWidget {
  const CustomMainViewBodyBlocListener({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemCartCubit, ItemCartState>(
      listener: (context, state) {
        if (state is ItemCartRemoved) {
          showBar(context, 'تم حذف المنتج من السلة بنجاح');
        } else if (state is ItemCartAdded) {
          showBar(context, 'تم اضافة المنتج الى السلة بنجاح');
        }
      },
      child: IndexedStack(
        index: currentIndex,
        children: const [HomeView(), ProductsView(), CartView()],
      ),
    );
  }
}
