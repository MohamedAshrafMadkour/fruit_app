import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:fruit_app/features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_login_body_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: 'تسجيل دخول'),
        body: CustomLoginBodyConsumer(),
      ),
    );
  }
}
