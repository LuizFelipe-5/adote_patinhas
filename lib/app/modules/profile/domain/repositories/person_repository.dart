import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, bool>> register({
    required PersonModel person,
  });
}
