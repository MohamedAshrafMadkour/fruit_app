import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
