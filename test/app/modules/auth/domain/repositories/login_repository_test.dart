import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/modules/auth/data/repositories/login_repository_impl.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/login_data_source.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late LoginDataSourceMock dataSource;
  late UserCredentialMock userCredential;
  late LoginRepository repository;

  setUp(() {
    dataSource = LoginDataSourceMock();
    userCredential = UserCredentialMock();
    repository = LoginRepositoryImpl(dataSource);
    when(() => dataSource.login(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(userCredential));
  });

  test('Should return an object of type Right', () async {
    final result = await repository.login(email: 'any', password: 'any');

    expect(result, isA<Right>());
  });

  test('Should return an object of type Left', () async {
    when(() => dataSource.login(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Left(UnknownFailure()));
    final result = await repository.login(email: 'any', password: 'any');
    expect(result, isA<Left>());
  });
}
