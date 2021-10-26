import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/legal_person_model.dart';
import 'package:dartz/dartz.dart';

abstract class LegalPersonRepository {
  Future<Either<Failure, bool>> register({
    required LegalPersonModel legalPerson,
  });
}
