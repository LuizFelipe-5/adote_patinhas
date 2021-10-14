import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, UserCredential>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
