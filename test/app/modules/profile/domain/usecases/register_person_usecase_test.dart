import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/cep_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/city_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/cpf_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/name_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/number_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/failures/state_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/repositories/person_repository.dart';
import 'package:adote_patinhas/app/modules/profile/domain/usecases/register_person_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  late PersonRepositoryMock repository;
  late RegisterPersonUsecase usecase;

  PersonModel person = PersonModel(
      name: 'name',
      cep: 'cep',
      city: 'city',
      state: 'state',
      cpf: 'cpf',
      number: 'number');
  setUp(() {
    repository = PersonRepositoryMock();
    usecase = RegisterPersonUsecaseImpl(repository: repository);
  });

  test('Should return an object of type Right', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => const Right(true));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result, isA<Right>());
  });

  test('Should return an object of type Left', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(CpfIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result, isA<Left>());
  });

  test('Should return true', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => const Right(true));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), equals(true));
  });

  test('Should return CpfIsEmptyFailure', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(CpfIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<CpfIsEmptyFailure>());
  });

  test('Should return NameIsEmptyFailure', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(NameIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<NameIsEmptyFailure>());
  });

  test('Should return NumberIsEmptyFailure', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(NumberIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<NumberIsEmptyFailure>());
  });

  test('Should return CepIsEmptyFailure', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(CepIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<CepIsEmptyFailure>());
  });

  test('Should return CityIsEmptyFailure', () async {
    //ARRANGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(CityIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<CityIsEmptyFailure>());
  });

  test('Should return StateIsEmptyFailure', () async {
    //ARRAGE
    when(() => repository.register(person: person))
        .thenAnswer((_) async => Left(StateIsEmptyFailure()));
    //ACT
    final result = await usecase.register(person: person);
    //ASSERT
    expect(result.fold(id, id), isA<StateIsEmptyFailure>());
  });
}
