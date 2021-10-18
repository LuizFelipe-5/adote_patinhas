import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/invalid_email_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/user_disabled_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/user_not_found_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/wrong_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthFailureHandler {
  static Failure resolve(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return UserNotFoundFailure(messsage: 'User not found');
    } else if (e.code == 'invalid-email') {
      return InvalidEmailFailure(message: 'Invlalid email');
    } else if (e.code == 'user-disabled') {
      return UserDisabledFailure(message: 'User disabled');
    } else if (e.code == 'wrong-password') {
      return WrongPasswordFailure(message: 'Wrong password');
    }

    return UnknownFailure();
  }
}
