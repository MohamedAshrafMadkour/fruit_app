import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/widgets/custom_password_field.dart';
import 'package:fruit_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_terms_and_condition.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/have_an_account.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email, password, name;
  late bool isTermsAccepted = false;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontal),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  name = value;
                },
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  email = value;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 16),
              CustomTermsAndCondition(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(height: 33),
              CustomSignButton(
                title: 'إنشاء حساب جديد',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<RegisterCubit>().createEmailAndPassword(
                        name: name!,
                        email: email!,
                        password: password!,
                      );
                    } else {
                      showBar(context, 'يجب عليك الموافقة على الشروط والإحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(height: 33),
              HaveAnAccount(),
              SizedBox(height: 33),
            ],
          ),
        ),
      ),
    );
  }
}
