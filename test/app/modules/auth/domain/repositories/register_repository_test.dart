import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/modules/auth/data/repositories/register_repository_impl.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/register_data_source.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RegisterDataSourceMock extends Mock implements RegisterDataSource {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late RegisterDataSourceMock dataSource;
  late UserCredentialMock userCredential;
  late RegisterRepository repository;

  setUp(() {
    dataSource = RegisterDataSourceMock();
    userCredential = UserCredentialMock();
    repository = RegisterRepositoryImpl(dataSource);
  });

  test('Should return an object of type Right', () async {
    when(() => dataSource.register(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(userCredential));

    final result =
        await repository.register(email: 'email', password: 'password');

    expect(result, isA<Right>());
  });

  test('Should return an object of type Left', () async {
    when(() => dataSource.register(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Left(UnknownFailure()));

    final result =
        await repository.register(email: 'email', password: 'password');

    expect(result, isA<Left>());
  });
}
