import 'package:dartz/dartz.dart';

import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/legal_person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/legal_person_data_source.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/legal_person_repository.dart';

class LegalPersonRepositoryImpl implements LegalPersonRepository {
  LegalPersonDataSource dataSource;

  LegalPersonRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> register(
      {required LegalPersonModel legalPerson}) {
    return dataSource.register(legalPerson: legalPerson);
  }
}
