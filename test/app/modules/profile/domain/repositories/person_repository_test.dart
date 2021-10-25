import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/modules/profile/data/repositories/person_repository_impl.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/person_data_source.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PersonDataSourceMock extends Mock implements PersonDataSource {}

void main() {
  late PersonDataSourceMock dataSource;
  late PersonRepository repository;

  PersonModel person = PersonModel(
      name: 'name',
      cep: 'cep',
      city: 'city',
      state: 'state',
      cpf: 'cpf',
      number: 'number');

  setUp(() {
    dataSource = PersonDataSourceMock();
    repository = PersonRepositoryImpl(dataSource: dataSource);
  });

  test('Should return an object of type Left', () async {
    //ARRANGE
    when(() => dataSource.register(person: person))
        .thenAnswer((_) async => Left(UnknownFailure()));
    //ACT
    final result = await repository.register(person: person);
    //ASSERT
    expect(result, isA<Left>());
  });

  test('Should return an object of type Right', () async {
    //ARRANGE
    when(() => dataSource.register(person: person))
        .thenAnswer((_) async => const Right(true));
    //ACT
    final result = await repository.register(person: person);
    //ASSERT
    expect(result, isA<Right>());
  });

  //dúvida
  test('Should return an object of type Right', () async {
    //ARRANGE
    when(() => dataSource.register(person: person))
        .thenAnswer((_) async => const Right(false));
    //ACT
    final result = await repository.register(person: person);
    //ASSERT
    expect(result, isA<Right>());
  });
}
