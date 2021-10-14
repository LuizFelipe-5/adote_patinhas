import 'package:adote_patinhas/app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  FirebaseAuth firebaseAuth;

  LoginRepository({required this.firebaseAuth});

  Future<Either<Failure, UserCredential>> login(
      String email, String password) async {
    final response = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return Right(response);
  }
}
