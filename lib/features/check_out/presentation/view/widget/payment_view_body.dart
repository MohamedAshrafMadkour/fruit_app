import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/app_decoration.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/custom_data_payment.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/shipping_address_widget.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          'ملخص الطلب :',
          style: Styles.textBold13.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: AppDecorations.greyBoxDecoration,
          child: const CustomDataPayment(),
        ),
        ShippingAddressWidget(pageController: pageController),
      ],
    );
  }
}
