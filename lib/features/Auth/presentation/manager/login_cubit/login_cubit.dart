import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  Future<void> loginInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.loginInEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(error: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(error: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(error: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
