import 'package:flutter/material.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_product_view_body_bloc_consumer.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontal),
      child: CustomProductViewBodyBlocConsumer(),
    );
  }
}
