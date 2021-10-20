import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/core/usecase.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmailAndPasswordUsecase implements UseCase {
  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password});
}

class LoginWithEmailAndPasswordUsecaseImpl
    implements LoginWithEmailAndPasswordUsecase {
  final LoginRepository repository;

  LoginWithEmailAndPasswordUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      return Left(EmailIsEmptyFailure());
    }
    if (password.isEmpty) {
      return Left(PasswordIsEmptyFailure());
    }
    return await repository.login(email: email, password: password);
  }
}
