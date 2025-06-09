import 'package:dartz/dartz.dart';
import 'package:fruit_app/core/error/exception.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/core/services/auth_service.dart';
import 'package:fruit_app/features/Auth/data/model/user_model.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;

  AuthRepoImpl({required this.authService});
  @override
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await authService.registerUser(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
