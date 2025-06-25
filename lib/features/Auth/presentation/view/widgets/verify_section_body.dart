import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/util/app_color.dart';
import 'package:fruit_app/core/util/styles.dart';
import 'package:fruit_app/core/widgets/custom_sign_button.dart';
import 'package:fruit_app/features/Auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_message_phone.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/verify_text_form_field.dart';

class VerifyCodeSectionBody extends StatefulWidget {
  final String verificationId;

  const VerifyCodeSectionBody({super.key, required this.verificationId});

  @override
  State<VerifyCodeSectionBody> createState() => _VerifyCodeSectionBodyState();
}

class _VerifyCodeSectionBodyState extends State<VerifyCodeSectionBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final List<TextEditingController> controller = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            const CustomMessagePhone(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                6,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: VerifyTextFormField(controller: controller[index]),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Visibility(
              visible: autovalidateMode == AutovalidateMode.always,
              child: Text(
                'ادخل كل الرموز',
                style: Styles.textSemiBold16.copyWith(color: Colors.red),
              ),
            ),
            const SizedBox(height: 16),
            CustomButton(
              title: 'تحقق من الرمز',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  final smsCode = controller.reversed
                      .map((c) => c.text.trim())
                      .join();
                  context.read<VerifyCubit>().confirmOtp(
                    smsCode: smsCode,
                    verificationId: widget.verificationId,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 24),

            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'إعادة إرسال الرمز',
                  style: Styles.textSemiBold16.copyWith(
                    color: AppColor.kLightPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
