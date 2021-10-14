import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/core/usecase.dart';
import 'package:adote_patinhas/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginWithEmailAndPasswordUsecase implements UseCase {
  Future<Either<Failure, UserCredential>> login(String email, String password);
}

class LoginWithEmailAndPasswordUsecaseImpl
    implements LoginWithEmailAndPasswordUsecase {
  final LoginRepository repository;

  LoginWithEmailAndPasswordUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, UserCredential>> login(String email, String password) {
    return repository.login(email, password);
  }
}
