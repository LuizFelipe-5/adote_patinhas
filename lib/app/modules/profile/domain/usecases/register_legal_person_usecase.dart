import 'package:adote_patinhas/app/modules/profile/domain/failures/cep_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/city_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/cnpj_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/name_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/number_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/state_is_empty_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/legal_person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/legal_person_repository.dart';

abstract class RegisterLegalPersonUsecase {
  Future<Either<Failure, bool>> register({
    required LegalPersonModel legalPerson,
  });
}

class RegisterLegalPersonUsecaseImpl implements RegisterLegalPersonUsecase {
  LegalPersonRepository repository;

  RegisterLegalPersonUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> register(
      {required LegalPersonModel legalPerson}) async {
    if (legalPerson.cnpj.isEmpty) {
      return Left(CnpjIsEmptyFailure());
    }
    if (legalPerson.name.isEmpty) {
      return Left(NameIsEmptyFailure());
    }
    if (legalPerson.number.isEmpty) {
      return Left(NumberIsEmptyFailure());
    }
    if (legalPerson.cep.isEmpty) {
      return Left(CepIsEmptyFailure());
    }

    if (legalPerson.city.isEmpty) {
      return Left(CityIsEmptyFailure());
    }

    if (legalPerson.state.isEmpty) {
      return Left(StateIsEmptyFailure());
    }

    return await repository.register(legalPerson: legalPerson);
  }
}
