import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/home/presentation/manager/update_cubit/update_item_cubit.dart';
import 'package:fruit_app/features/home/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateItemCubit(),
      child: const CartViewBody(),
    );
  }
}
