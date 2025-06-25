import 'package:flutter/material.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_selling_item.dart';

class CustomGeneralProduct extends StatelessWidget {
  const CustomGeneralProduct({
    super.key,
    required this.products,
    required this.isLoading,
  });
  final List<ProductEntity> products;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 170 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return CustomSellingItem(
          productEntity: products[index],
          isLoading: isLoading,
        );
      },
    );
  }
}
