import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:adote_patinhas/app/modules/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, UserCredential>> login(CredentialsParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
