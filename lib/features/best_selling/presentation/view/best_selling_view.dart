import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/manager/product_cubit/products_cubit.dart';
import 'package:fruit_app/core/repo/product_repo.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/features/best_selling/presentation/view/widgets/best_selling_body_bloc_listener.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'BestSellingView';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar(
          context,
          text: 'الأكثر مبيعًا',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const BestSellingBodyBlocListener(),
      ),
    );
  }
}
