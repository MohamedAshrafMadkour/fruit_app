import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/constants/collection_firebase.dart';
import 'package:fruit_app/core/error/exception.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/core/services/auth_service.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/features/Auth/data/model/user_model.dart';
import 'package:fruit_app/features/Auth/domain/entites/user_entity.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.databaseService, required this.authService});
  @override
  Future<Either<Failure, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await authService.registerUser(email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addData(user: userEntity);
      return Right(userEntity);
    } on AuthException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginInEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await authService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUser(uId: user.uid);
      return Right(userEntity);
    } on AuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await authService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await authService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithApple() async {
    try {
      final user = await authService.signInWithApple();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<void> addData({required UserEntity user}) async {
    var data = UserModel.fromEntity(user).toMap();
    await databaseService.addData(
      path: CollectionFirebase.userEndPoint,
      data: data,
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    var data = await databaseService.getData(
      documentId: uId,
      path: CollectionFirebase.getUserEndPoint,
    );
    return UserModel.fromJson(data);
  }

  @override
  Future deleteUser(User? user) async {
    if (user != null) {
      return authService.deleteUser();
    }
  }
}
