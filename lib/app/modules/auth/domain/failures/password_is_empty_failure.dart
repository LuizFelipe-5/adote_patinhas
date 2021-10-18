import 'package:adote_patinhas/app/core/failure.dart';

class PasswordIsEmptyFailure implements Failure {
  final String message;

  PasswordIsEmptyFailure({required this.message});
}
