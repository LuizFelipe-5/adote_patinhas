import 'package:adote_patinhas/app/core/failure.dart';

class InvalidEmailFailure implements Failure {
  final String message;

  InvalidEmailFailure({required this.message});
}
