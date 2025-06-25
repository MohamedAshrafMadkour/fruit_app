import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/best_selling/presentation/view/widgets/best_selling_view_body_bloc_builder.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontal),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الأكثر مبيعًا',
                  textAlign: TextAlign.right,
                  style: Styles.textBold16.copyWith(
                    color: const Color(0xFF0C0D0D),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const BestSellingViewBodyBlocBuilder(),
        ],
      ),
    );
  }
}
