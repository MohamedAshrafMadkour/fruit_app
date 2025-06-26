import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/details_view_body.dart';

class DetailsViewBodyBlocListener extends StatelessWidget {
  const DetailsViewBodyBlocListener({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemCartCubit, ItemCartState>(
      listener: (context, state) {
        if (state is ItemCartAdded) {
          showBar(context, 'تم اضافة المنتج الى السلة بنجاح');
        }
      },
      child: DetailsViewBody(productEntity: product),
    );
  }
}
