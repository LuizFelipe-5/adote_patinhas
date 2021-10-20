import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/register_data_source.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/register_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, UserCredential>> register(
      {required String email, required String password}) {
    return dataSource.register(email: email, password: password);
  }
}
