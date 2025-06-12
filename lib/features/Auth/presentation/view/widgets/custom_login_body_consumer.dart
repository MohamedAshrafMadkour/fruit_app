import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/login_view_body.dart';

class CustomLoginBodyConsumer extends StatelessWidget {
  const CustomLoginBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showBar(context, state.error);
        } else if (state is LoginSuccess) {
          showBar(context, 'تم تسجيل الدخول بنجاح');
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
