import 'package:flutter/material.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});
  final Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      isObscure: isObscureText,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      icon: GestureDetector(
        onTap: () {
          isObscureText = !isObscureText;
          setState(() {});
        },
        child: isObscureText
            ? const Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            : const Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
    );
  }
}
