import 'package:flutter/material.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentViewBody(pageController: pageController);
  }
}
