import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, UserEntity>> loginInEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future<Either<Failure, UserEntity>> loginWithApple();
  Future<void> addData({required UserEntity user});
  Future<UserEntity> getUser({required String uId});
  Future deleteUser(User? user);
}
