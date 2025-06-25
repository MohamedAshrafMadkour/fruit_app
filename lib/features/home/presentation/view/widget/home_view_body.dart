import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/manager/featured_cubit/featured_product_cubit.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_featured_item_list_bloc_builder.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_home_app_bar.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_selling_header.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_selling_item_bloc_consumer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<FeaturedProductCubit>().featuredProduct();
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeAppBar(),
              const SizedBox(height: 16),
              Text(
                'المنتجات المميزة',
                style: Styles.textBold16.copyWith(
                  color: const Color(0xFF0C0D0D),
                ),
              ),
              const SizedBox(height: 16),
              const CustomFeaturedItemListBlocBuilder(),
              const SizedBox(height: 16),
              const CustomSellingHeader(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const CustomSellingItemScroll(),
      ],
    );
  }
}
