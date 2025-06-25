import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/shipping_item.dart';

class ShippingView extends StatefulWidget {
  const ShippingView({super.key});

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView>
    with AutomaticKeepAliveClientMixin {
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var item = context.read<OrderEntity>();
    return Column(
      children: [
        const SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '${item.cartEntity.calculateTotalPrice() + 30} جنيه',
          isSelected: currentIndex == 0,
          onTap: () {
            setState(() {
              currentIndex = 0;
              item.isPaypal = true;
            });
          },
        ),
        const SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع اونلاين ',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '${item.cartEntity.calculateTotalPrice()} ',
          isSelected: currentIndex == 1,
          onTap: () {
            setState(() {
              currentIndex = 1;
              item.isPaypal = false;
            });
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
