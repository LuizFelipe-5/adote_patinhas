import 'package:adote_patinhas/app/core/failure.dart';

class UserNotFoundFailure implements Failure {
  String messsage;
  UserNotFoundFailure({
    required this.messsage,
  });
}
