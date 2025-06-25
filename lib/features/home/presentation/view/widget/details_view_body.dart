import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/core/util/app_image.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/custom_details_image.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_details_card.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_unique_data.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_unique_data_image.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDetailsImage(productEntity: productEntity),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDetailCard(productEntity: productEntity),
              const SizedBox(height: 16),
              Text(
                productEntity.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Styles.textRegular13.copyWith(
                  color: const Color(0xFF969899),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomUniqueData(
                    subtitle: 'الصلاحية',
                    title: productEntity.expirationMonths.toString(),
                  ),
                  CustomUniqueDataImage(
                    title: productEntity.isOrganic ? '100%' : '0%',
                    subtitle: 'اورجانيك',
                    image: Assets.imagesLotus,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomUniqueDataImage(
                title: '${productEntity.numberOfCalories} كالوري ',
                subtitle: '${productEntity.unitAmount} جرام',
                image: Assets.imagesCaloray,
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: 'اضف الى السلة',
                onPressed: () {
                  context.read<ItemCartCubit>().addItemToCart(productEntity);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
