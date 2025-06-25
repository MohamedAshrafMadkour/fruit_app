import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/app_decoration.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.tile, required this.child});

  final String tile;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$tile:', style: Styles.textBold13),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: AppDecorations.greyBoxDecoration,
          child: child,
        ),
      ],
    );
  }
}
