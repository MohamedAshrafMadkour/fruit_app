import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/Auth/presentation/manager/update_password/update_password_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';

class NewPasswordSectionBody extends StatefulWidget {
  const NewPasswordSectionBody({super.key});

  @override
  State<NewPasswordSectionBody> createState() => _NewPasswordSectionBodyState();
}

class _NewPasswordSectionBodyState extends State<NewPasswordSectionBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  password = value;
                },
                hintText: 'كلمة مرور جديدة',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                onSaved: (value) {
                  confirmPassword = value;
                },
                hintText: 'تاكيد كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 30),
              CustomButton(
                title: 'إنشاء كلمة مرور جديدة',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<UpdatePasswordCubit>().updatePassword(
                      newPassword: password!,
                      ephemeralPassword: confirmPassword!,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
