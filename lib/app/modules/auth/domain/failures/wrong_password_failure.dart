import 'package:adote_patinhas/app/core/failure.dart';

class WrongPasswordFailure implements Failure {
  final String message;

  WrongPasswordFailure({required this.message});
}
