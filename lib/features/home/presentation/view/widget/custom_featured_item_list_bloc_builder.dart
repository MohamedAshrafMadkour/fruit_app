import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/get_dummy.dart';
import 'package:fruit_app/core/manager/featured_cubit/featured_product_cubit.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/widgets/custom_error_message.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_feature_item_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomFeaturedItemListBlocBuilder extends StatelessWidget {
  const CustomFeaturedItemListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedProductCubit, FeaturedProductState>(
      builder: (context, state) {
        if (state is FeaturedProductFailure) {
          return CustomErrorText(errorMessage: state.errorMessage);
        } else if (state is FeaturedProductSuccess) {
          log(state.products.length.toString());
          return CustomFeaturedItemList(products: state.products);
        } else {
          return Skeletonizer(
            enabled: state is ProductsLoading,
            child: CustomFeaturedItemList(
              products: getDummyFeaturedProductsList(),
            ),
          );
        }
      },
    );
  }
}
