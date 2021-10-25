import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/person_data_source.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonDataSource dataSource;

  PersonRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, bool>> register({required PersonModel person}) {
    return dataSource.register(person: person);
  }
}
