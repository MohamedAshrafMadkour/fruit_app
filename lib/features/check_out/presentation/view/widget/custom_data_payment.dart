import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/features/check_out/domain/entity/order_entity.dart';

class CustomDataPayment extends StatelessWidget {
  const CustomDataPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'المجموع الفرعي :',
              style: Styles.textRegular13.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
            const Spacer(),
            Text(
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
              textAlign: TextAlign.right,
              style: Styles.textSemiBold16.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'التوصيل  :',
              style: Styles.textRegular13.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
            const Spacer(),
            Text(
              '30 جنيه',
              textAlign: TextAlign.right,
              style: Styles.textSemiBold13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(height: 2, color: Color(0xFFDCDEDE)),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'المجموع الكلي :',
              style: Styles.textRegular13.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
            const Spacer(),
            Text(
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
              textAlign: TextAlign.right,
              style: Styles.textSemiBold16.copyWith(
                color: const Color(0xFF0C0D0D),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
