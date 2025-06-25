import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

class VerifyTextFormField extends StatelessWidget {
  const VerifyTextFormField({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .12,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          } else {
            return null;
          }
        },
        textInputAction: TextInputAction.next,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintStyle: Styles.textBold13.copyWith(color: const Color(0xFFBDBDBD)),
          fillColor: const Color(0xFFF9FAFA),
          filled: true,
          border: outlineInputBorder(const Color(0xFFE6E9E9)),
          enabledBorder: outlineInputBorder(const Color(0xFFE6E9E9)),
          focusedBorder: outlineInputBorder(const Color(0xFFF4A91F)),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,

        strokeAlign: BorderSide.strokeAlignCenter,
        color: color,
      ),
    );
  }
}
