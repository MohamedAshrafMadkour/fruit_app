import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/helper/keys.dart';
import 'package:fruit_app/core/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';
import 'package:fruit_app/features/check_out/domain/entity/payment_order_entity/payment_order_entity.dart';
import 'package:fruit_app/features/check_out/presentation/manager/cubit/add_order_cubit.dart';
import 'package:fruit_app/features/check_out/presentation/view/widget/custom_page_view.dart';

import 'package:fruit_app/features/check_out/presentation/view/widget/check_out_steps.dart';
import 'package:provider/provider.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  int pageControllerIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      pageControllerIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            currentPageIndex: pageControllerIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CustomPageView(
              valueListenable: valueNotifier,
              formKey: formKey,
              pageController: pageController,
            ),
          ),
          CustomButton(
            title: getNextButtonText(pageControllerIndex),
            onPressed: () {
              if (pageController.page == 0) {
                handleShippingProcess(context);
              } else if (pageController.page == 1) {
                handleAddressProcess();
              } else {
                handlePaypalProcess(context);
              }
            },
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * .1),
        ],
      ),
    );
  }

  void handlePaypalProcess(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaymentOrderEntity paymentOrderEntity = PaymentOrderEntity.fromEntity(
      orderEntity,
    );
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kClientId,
          secretKey: kSecretId,
          transactions: [paymentOrderEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            addOrderCubit.addOrder(orderEntity);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
            showBar(context, error.toString());
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }

  void handleAddressProcess() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void handleShippingProcess(BuildContext context) {
    if (context.read<OrderEntity>().isPaypal != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      showBar(context, 'اختر طريقة الدفع');
    }
  }
}

List<String> getItemsTextList() {
  return ['الشحن', 'العنوان', 'الدفع'];
}

String getNextButtonText(int currentPageIndex) {
  switch (currentPageIndex) {
    case 0:
      return 'التالي';
    case 1:
      return 'التالي';
    case 2:
      return 'الدفع عبر PayPal';
    default:
      return 'التالي';
  }
}
