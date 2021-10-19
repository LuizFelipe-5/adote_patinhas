import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterWithEmailAndPassword {
  Future<Either<Failure, UserCredential>> register(
      {required String email, required String password});
}

class RegisterWithEmailAndPasswordImpl implements RegisterWithEmailAndPassword {
  final RegisterRepository repository;

  RegisterWithEmailAndPasswordImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> register(
      {required String email, required String password}) async {
    if (email.isEmpty) {
      return Left(EmailIsEmptyFailure());
    }
    if (password.isEmpty) {
      return Left(PasswordIsEmptyFailure());
    }
    return await repository.register(email: email, password: password);
  }
}
