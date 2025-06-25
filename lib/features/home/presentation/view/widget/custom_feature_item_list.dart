import 'package:flutter/material.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_featured_item.dart';

class CustomFeaturedItemList extends StatelessWidget {
  const CustomFeaturedItemList({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.from(
          List.generate(
            products.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomFeaturedItem(product: products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
