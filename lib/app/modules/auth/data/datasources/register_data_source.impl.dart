import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/data/failure_handler/firebase_auth_failure_handler.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/register_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  FirebaseAuth firebaseAuth;

  RegisterDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, UserCredential>> register(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailureHandler.resolve(e));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
