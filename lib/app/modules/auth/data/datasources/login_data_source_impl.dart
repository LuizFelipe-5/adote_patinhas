import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/data/failure_handler/firebase_auth_failure_handler.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/login_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:adote_patinhas/app/modules/auth/domain/usecases/login_with_email_and_password_usecase.dart';

class LoginDataSourceImpl implements LoginDataSource {
  FirebaseAuth firebaseAuth;

  LoginDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, UserCredential>> login(
      CredentialsParams params) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailureHandler.resolve(e));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
