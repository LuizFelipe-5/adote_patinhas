import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/login_data_source.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password}) {
    return dataSource.login(email: email, password: password);
  }
}
