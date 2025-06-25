part of 'verify_cubit.dart';

sealed class VerifyState {
  const VerifyState();
}

final class VerifyInitial extends VerifyState {}

final class VerifyLoading extends VerifyState {}

final class VerifySuccess extends VerifyState {}

class VerifyCodeSent extends VerifyState {
  final String verificationId;
  VerifyCodeSent({required this.verificationId});
}

final class VerifyFailure extends VerifyState {
  final String error;
  VerifyFailure({required this.error});
}
