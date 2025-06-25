import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_app/features/Auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/new_password_section.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/verify_section_body.dart';

class VerifyCodeSection extends StatelessWidget {
  const VerifyCodeSection({super.key, required this.verificationId});
  static const routeName = 'check_code_section';

  final String verificationId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        text: 'التحقق من الرمز',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: VerifyCodeSectionBlocConsumer(verificationId: verificationId),
    );
  }
}

class VerifyCodeSectionBlocConsumer extends StatelessWidget {
  const VerifyCodeSectionBlocConsumer({
    super.key,

    required this.verificationId,
  });

  final String verificationId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifySuccess) {
          Navigator.pushNamed(context, NewPasswordSection.routeName);
        } else if (state is VerifyFailure) {
          showBar(context, state.error);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          inAsyncCall: state is VerifyLoading,
          child: VerifyCodeSectionBody(verificationId: verificationId),
        );
      },
    );
  }
}
