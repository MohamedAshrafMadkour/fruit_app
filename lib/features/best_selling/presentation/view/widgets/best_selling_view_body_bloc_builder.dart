import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/get_dummy.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/widgets/custom_error_message.dart';
import 'package:fruit_app/features/best_selling/presentation/view/widgets/custom_all_seling_products.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingViewBodyBlocBuilder extends StatelessWidget {
  const BestSellingViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return CustomAllSellingProducts(
            products: state.products,
            isLoading: true,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorText(errorMessage: state.errorMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: state is ProductsLoading,
            child: CustomAllSellingProducts(
              products: getDummyProductsList(),
              isLoading: false,
            ),
          );
        }
      },
    );
  }
}
