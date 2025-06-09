import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/register_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomRegisterBodyConsumer extends StatelessWidget {
  const CustomRegisterBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showBar(context, state.error);
        } else if (state is RegisterSuccess) {
          showBar(context, 'تم التسجيل بنجاح');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading ? true : false,
          child: RegisterViewBody(),
        );
      },
    );
  }
}
