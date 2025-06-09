import 'package:flutter/material.dart';
import 'package:fruit_app/core/util/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,

    this.onPressed,
    this.isObscure,
    this.icon,
    this.onSaved,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final void Function()? onPressed;
  final bool? isObscure;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      obscureText: isObscure ?? false,
      keyboardType: keyboardType,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        fillColor: const Color(0xFFF9FAFA),
        filled: true,
        suffixIcon: icon,
        suffixIconColor: const Color(0xFFBDBDBD),
        hintText: hintText,
        hintStyle: Styles.textBold13.copyWith(color: const Color(0xFFBDBDBD)),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
    );
  }
}
