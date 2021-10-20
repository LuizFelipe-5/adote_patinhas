import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/data/failure_handler/firebase_auth_failure_handler.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/login_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginDataSourceImpl implements LoginDataSource {
  FirebaseAuth firebaseAuth;

  LoginDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (exception) {
      return Left(FirebaseAuthFailureHandler.resolve(exception));
    } catch (exception) {
      return Left(UnknownFailure());
    }
  }
}
