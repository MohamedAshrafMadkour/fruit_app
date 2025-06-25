import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:fruit_app/features/Auth/presentation/manager/verify_cubit/verify_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/forget_password_view_body.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/verify_section.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = 'forget_password_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          text: 'نسيان كلمة المرور',
          isActionActive: false,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const ForgetPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}

class ForgetPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCubit, VerifyState>(
      listener: (context, state) {
        if (state is VerifyCodeSent) {
          Navigator.pushNamed(
            context,
            VerifyCodeSection.routeName,
            arguments: {
              'verificationId': state.verificationId,
              'cubit': context.read<VerifyCubit>(),
            },
          );
        }
        if (state is VerifyFailure) {
          showBar(context, state.error);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          inAsyncCall: state is VerifyLoading,
          child: const ForgetPasswordViewBody(),
        );
      },
    );
  }
}
