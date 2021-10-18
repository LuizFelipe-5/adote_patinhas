import 'package:adote_patinhas/app/core/failure.dart';

class EmailIsEmptyFailure implements Failure {
  final String message;

  EmailIsEmptyFailure({required this.message});
}