import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/core/helper/build_snack_bar.dart';
import 'package:fruit_app/core/services/get_it_service.dart';
import 'package:fruit_app/core/widgets/build_app_bar.dart';
import 'package:fruit_app/core/widgets/custom_progress_indicator.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:fruit_app/features/Auth/presentation/manager/update_password/update_password_cubit.dart';
import 'package:fruit_app/features/Auth/presentation/view/login_view.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/custom_congratulation_dialog.dart';
import 'package:fruit_app/features/Auth/presentation/view/widgets/new_password_section_body.dart';

class NewPasswordSection extends StatelessWidget {
  const NewPasswordSection({super.key});
  static const routeName = 'new_password_section';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          text: 'كلمة مرور جديدة',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginView.routeName,
              (route) => false,
            );
          },
        ),
        body: const NewPasswordSectionBlocConsumer(),
      ),
    );
  }
}

class NewPasswordSectionBlocConsumer extends StatelessWidget {
  const NewPasswordSectionBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
      listener: (context, state) {
        if (state is UpdatePasswordSuccess) {
          showCongratulationDialog(context);
        } else if (state is UpdatePasswordFailure) {
          showBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicator(
          inAsyncCall: state is UpdatePasswordLoading,
          child: const NewPasswordSectionBody(),
        );
      },
    );
  }
}
