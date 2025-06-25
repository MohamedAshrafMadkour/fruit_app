import 'package:flutter/material.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_item_action_button.dart';

class CustomDetailCard extends StatelessWidget {
  const CustomDetailCard({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.name,
                style: Styles.textBold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${productEntity.price}جنية ',
                      style: Styles.textBold16.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                    TextSpan(
                      text: '/',
                      style: Styles.textBold16.copyWith(
                        color: const Color(0xFFF8C76D),
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: Styles.textBold16.copyWith(
                        color: const Color(0xFFF4A91F),
                      ),
                    ),
                    TextSpan(
                      text: 'الكيلو',
                      style: Styles.textBold16.copyWith(
                        color: const Color(0xFFF8C76D),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Row(
            children: [
              CartItemActionButton(
                height: 30,
                width: 30,
                iconColor: Colors.white,
                icon: Icons.add,
                color: AppColor.kPrimaryColor,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: Styles.textBold16.copyWith(
                    color: const Color(0xFF0C0D0D),
                  ),
                ),
              ),
              CartItemActionButton(
                height: 30,
                width: 30,
                iconColor: Colors.grey,
                icon: Icons.remove,
                color: const Color(0xFFF3F5F7),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
