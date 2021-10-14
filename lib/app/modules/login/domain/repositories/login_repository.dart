import 'package:adote_patinhas/app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserCredential>> login(String email, String password);
}
