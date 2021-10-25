import 'package:dartz/dartz.dart';

import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/cep_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/city_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/cpf_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/name_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/number_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/state_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/person_repository.dart';

abstract class RegisterPersonUsecase {
  Future<Either<Failure, bool>> register({
    required PersonModel person,
  });
}

class RegisterPersonUsecaseImpl implements RegisterPersonUsecase {
  PersonRepository repository;

  RegisterPersonUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> register({required PersonModel person}) async {
    if (person.cpf.isEmpty) {
      return Left(CpfIsEmptyFailure());
    }
    if (person.name.isEmpty) {
      return Left(NameIsEmptyFailure());
    }
    if (person.number.isEmpty) {
      return Left(NumberIsEmptyFailure());
    }
    if (person.cep.isEmpty) {
      return Left(CepIsEmptyFailure());
    }
    if (person.city.isEmpty) {
      return Left(CityIsEmptyFailure());
    }
    if (person.state.isEmpty) {
      return Left(StateIsEmptyFailure());
    }

    return await repository.register(person: person);
  }
}
