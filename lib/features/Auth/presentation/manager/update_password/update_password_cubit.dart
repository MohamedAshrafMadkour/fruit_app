import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this.authRepo) : super(UpdatePasswordInitial());
  final AuthRepo authRepo;

  Future<void> updatePassword({
    required String newPassword,
    required String ephemeralPassword,
  }) async {
    final bool hasLetters = newPassword.contains(RegExp(r'[A-Za-z]'));
    final bool hasNumbers = newPassword.contains(RegExp(r'\d'));
    if (newPassword.length < 8) {
      emit(
        const UpdatePasswordFailure(
          errorMessage: 'الباسورد يجب ان يكون اكثر من 8 رموز',
        ),
      );
      return;
    }
    if (!hasLetters || !hasNumbers) {
      emit(
        const UpdatePasswordFailure(
          errorMessage: ' الباسورد يجب ان يحتوي على ارقام و حروف',
        ),
      );
      return;
    }
    if (ephemeralPassword != newPassword) {
      emit(
        const UpdatePasswordFailure(
          errorMessage: 'your confirm password is not correct',
        ),
      );
      return;
    }
    emit(UpdatePasswordLoading());

    final result = await authRepo.updatePassword(newPassword: newPassword);
    result.fold(
      (failure) => emit(UpdatePasswordFailure(errorMessage: failure.message)),
      (user) => emit(UpdatePasswordSuccess()),
    );
  }
}
