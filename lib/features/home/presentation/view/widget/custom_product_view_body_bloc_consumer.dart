import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/features/home/presentation/view/widget/product_view_body.dart';

class CustomProductViewBodyBlocConsumer extends StatelessWidget {
  const CustomProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
      child: const ProductViewBody(),
    );
  }
}
