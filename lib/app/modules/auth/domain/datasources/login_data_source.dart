import 'package:adote_patinhas/app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password});
}
