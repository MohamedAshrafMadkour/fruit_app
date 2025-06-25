import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/constants/collection_firebase.dart';
import 'package:fruit_app/core/constants/constant.dart';
import 'package:fruit_app/core/error/exception.dart';
import 'package:fruit_app/core/error/server_failure.dart';
import 'package:fruit_app/core/services/auth_service.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/services/shared_pref.dart';
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
      return right(userEntity);
    } on AuthException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
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
      await saveUserData(user: userEntity);
      return right(UserModel.fromFirebaseUser(user));
    } on AuthException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await authService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await authService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future addData({required UserEntity user}) async {
    var data = UserModel.fromEntity(user).toMap();
    await databaseService.addData(
      path: CollectionFirebase.addUser,
      data: data,
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUser({required String uId}) async {
    var data = await databaseService.getData(
      documentId: uId,
      path: CollectionFirebase.getUser,
    );

    return UserModel.fromJson(data);
  }

  @override
  Future deleteUser(User? user) async {
    if (user != null) {
      return authService.deleteUser();
    }
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    SharedPref.setString(kSaveData, jsonData);
  }

  @override
  Future<Either<Failure, void>> sendOtp({
    required String phone,
    required void Function(String verificationId) onCodeSent,
  }) async {
    try {
      await authService.verifyPhone(phone: phone, onCodeSent: onCodeSent);
      return const Right(null);
    } on SocketException {
      return left(ServerFailure(message: 'تاكد من اتصالك بالانترنت.'));
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> confirmOtp({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      await authService.confirmPhone(
        smsCode: smsCode,
        verificationId: verificationId,
      );
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-phone-number') {
        return left(ServerFailure(message: 'رقم الهاتف غير صحيح.'));
      } else if (e.code == 'too-many-requests') {
        return left(ServerFailure(message: 'تم استخدام هذا الرقم من قبل.'));
      } else if (e.code == 'invalid-verification-code') {
        return left(ServerFailure(message: 'كود التحقق غير صحيح.'));
      } else {
        return left(
          ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword({
    required String newPassword,
  }) async {
    try {
      await authService.updatePassword(newPassword: newPassword);
      return const Right(null);
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }
}
