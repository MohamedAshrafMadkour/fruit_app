import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/helper/get_user.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:fruit_app/features/check_out/domain/entity/shipping_address_entity.dart';
import 'package:fruit_app/features/check_out/domain/repo/order_repo.dart';
import 'package:fruit_app/features/check_out/presentation/manager/cubit/add_order_cubit.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/check_out_view_body.dart';
import 'package:fruit_app/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});
  static const routeName = 'CheckOutView';
  final CartEntity cartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
      uId: getUser().uId,
      cartEntity: widget.cartEntity,
      shippingAddress: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          text: 'الشحن',
          isActionActive: false,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Provider<OrderEntity>.value(
          value: orderEntity,
          child: const CheckOutViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}

class CheckOutViewBodyBlocConsumer extends StatelessWidget {
  const CheckOutViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showBar(context, 'تم شراء الطلب بنجاح');
        } else if (state is AddOrderFailure) {
          showBar(context, state.error);
        }
      },
      builder: (context, state) {
        return const CheckOutViewBody();
      },
    );
  }
}
