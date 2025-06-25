import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/address_view.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/payment_view.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/shipping_view.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages(formKey, valueListenable, pageController).length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return getPages(formKey, valueListenable, pageController)[index];
      },
    );
  }
}

List<Widget> getPages(
  GlobalKey<FormState> formKey,
  ValueListenable<AutovalidateMode> valueListenable,
  PageController pageController,
) {
  return [
    const ShippingView(),
    AddressView(formKey: formKey, valueListenable: valueListenable),
    PaymentView(pageController: pageController),
  ];
}
