import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/manager/featured_cubit/featured_product_cubit.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/features/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
          ),
          BlocProvider(
            create: (context) => FeaturedProductCubit(getIt.get<ProductRepo>()),
          ),
        ],
        child: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
