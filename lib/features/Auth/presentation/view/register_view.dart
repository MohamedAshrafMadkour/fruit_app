import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/custom_app_bar.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:fruit_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_register_view_consumer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routeName = 'register';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: ' حساب جديد'),
        body: CustomRegisterBodyConsumer(),
      ),
    );
  }
}
