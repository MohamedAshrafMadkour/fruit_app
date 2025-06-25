import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/check_out/presentation/check_out_view.dart';
import 'package:fruit_app/features/home/presentation/manager/item_cart/item_cart_cubit.dart';
import 'package:fruit_app/features/home/presentation/manager/update_cubit/update_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateItemCubit, UpdateItemState>(
      builder: (context, state) {
        return CustomButton(
          title:
              'الدفع  ${context.watch<ItemCartCubit>().cartEntity.calculateTotalPrice()} جنيه',
          onPressed: () {
            if (context.read<ItemCartCubit>().cartEntity.cartList.isNotEmpty) {
              Navigator.pushNamed(
                context,
                CheckOutView.routeName,
                arguments: context.read<ItemCartCubit>().cartEntity,
              );
            } else {
              showBar(context, 'السلة فارغة');
            }
          },
        );
      },
    );
  }
}
