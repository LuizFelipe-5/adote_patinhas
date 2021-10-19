import 'package:adote_patinhas/app/core/failure.dart';

class UserDisabledFailure implements Failure {
  final String message;

  UserDisabledFailure({required this.message});
}
