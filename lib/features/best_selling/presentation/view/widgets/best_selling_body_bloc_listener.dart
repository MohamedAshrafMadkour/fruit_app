import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/features/best_selling/presentation/view/widgets/best_selling_view_body.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';

class BestSellingBodyBlocListener extends StatelessWidget {
  const BestSellingBodyBlocListener({super.key});

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
      child: const BestSellingViewBody(),
    );
  }
}
