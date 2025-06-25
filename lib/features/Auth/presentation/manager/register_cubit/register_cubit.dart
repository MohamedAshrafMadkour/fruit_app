import 'package:bloc/bloc.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  Future<void> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    final bool hasLetters = password.contains(RegExp(r'[A-Za-z]'));
    final bool hasNumbers = password.contains(RegExp(r'\d'));
    if (password.length < 8) {
      emit(RegisterFailure(error: 'الباسورد يجب ان يكون اكثر من 8 رموز'));
      return;
    }

    if (!hasLetters || !hasNumbers) {
      emit(RegisterFailure(error: ' الباسورد يجب ان يحتوي على ارقام و حروف'));
      return;
    }

    emit(RegisterLoading());
    final result = await authRepo.createEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(RegisterFailure(error: failure.message)),
      (user) => emit(RegisterSuccess(user: user)),
    );
  }
}
