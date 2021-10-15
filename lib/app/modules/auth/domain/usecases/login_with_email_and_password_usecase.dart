import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/core/usecase.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_falilure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmailAndPasswordUsecase implements UseCase {
  Future<Either<Failure, UserCredential>> login(CredentialsParams params);
}

class LoginWithEmailAndPasswordUsecaseImpl
    implements LoginWithEmailAndPasswordUsecase {
  final LoginRepository repository;

  LoginWithEmailAndPasswordUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, UserCredential>> login(
      CredentialsParams params) async {
    if (params.email.isEmpty) {
      throw EmailIsEmptyFailure('Email is Empty');
    }
    if (params.password.isEmpty) {
      throw PasswordIsEmptyFailure('Password is empty');
    }
    return await repository.login(params);
  }
}

class CredentialsParams {
  final String email;
  final String password;

  CredentialsParams({required this.email, required this.password});
}
