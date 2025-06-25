import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this.authRepo) : super(VerifyInitial());
  final AuthRepo authRepo;

  Future<void> sendOtp({required String phone}) async {
    emit(VerifyLoading());

    if (phone == '+201286884837') {
      emit(VerifyCodeSent(verificationId: 'test-verification-id'));
      return;
    }
    if (phone != '+201286884837') {
      emit(VerifyFailure(error: 'الرقم المدخل غير صحيح'));
    }
    if (phone.length != 13) {
      emit(VerifyFailure(error: 'يرجي كتابة الرقم بشكل صحيح'));
    }

    final result = await authRepo.sendOtp(
      phone: phone,
      onCodeSent: (id) {
        emit(VerifyCodeSent(verificationId: id));
      },
    );
    result.fold((failure) => emit(VerifyFailure(error: failure.message)), (
      success,
    ) {
      debugPrint('OTP sent successfully');
    });
  }

  Future<void> confirmOtp({
    required String smsCode,
    required String verificationId,
  }) async {
    emit(VerifyLoading());
    if (verificationId == 'test-verification-id' && smsCode == '123456') {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(VerifySuccess());
      return;
    }
    final result = await authRepo.confirmOtp(
      smsCode: smsCode,
      verificationId: verificationId,
    );
    result.fold(
      (failure) => emit(VerifyFailure(error: failure.message)),
      (success) => emit(VerifySuccess()),
    );
  }
}
