import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/invalid_email_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/user_disabled_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/user_not_found_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/wrong_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFailureHandler {
  static Failure resolve(FirebaseAuthException exception) {
    if (exception.code == 'user-not-found') {
      return UserNotFoundFailure();
    } else if (exception.code == 'invalid-email') {
      return InvalidEmailFailure();
    } else if (exception.code == 'user-disabled') {
      return UserDisabledFailure();
    } else if (exception.code == 'wrong-password') {
      return WrongPasswordFailure();
    }

    return UnknownFailure();
  }
}
