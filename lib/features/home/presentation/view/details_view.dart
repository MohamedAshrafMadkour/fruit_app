import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/entity/product_entity.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/details_view_body_bloc_listener.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  static const routeName = 'details_view';
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemCartCubit(),
      child: Scaffold(body: DetailsViewBodyBlocListener(product: product)),
    );
  }
}
