import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/core/widgets/search_text_field.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_general_item_scroll.dart';
import 'package:fruit_app/features/home/presentation/view/widget/custom_product_header.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              buildAppBar(
                context,
                isChoice: false,
                text: 'المنتجات',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              const SearchTextField(),
              const SizedBox(height: 16),
              const CustomProductHeader(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const CustomGeneralItemScroll(),
      ],
    );
  }
}
