import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/register_repository.dart';
import 'package:adote_patinhas/app/modules/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class RegisterRepositoryMock extends Mock implements RegisterRepository {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late RegisterRepositoryMock repository;
  late RegisterWithEmailAndPasswordUsecase usecase;
  late UserCredential userCredential;

  setUp(() {
    repository = RegisterRepositoryMock();
    userCredential = UserCredentialMock();
    usecase = RegisterWithEmailAndPasswordUsecaseImpl(repository);
    when(() => repository.register(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(userCredential));
  });

  test('Should return an object of type Right ', () async {
    final result = await usecase.register(email: 'any', password: 'any');
    expect(result, isA<Right>());
  });

  test('Should give an error when email is empty', () async {
    when(() => repository.register(email: 'email', password: 'password'))
        .thenAnswer((_) async => Left(EmailIsEmptyFailure()));

    final result = await usecase.register(email: '', password: '23');

    expect(result, isA<Left>());
  });

  test('Should give an error when password is empty', () async {
    when(() => repository.register(email: 'email', password: 'password'))
        .thenAnswer((_) async => Left(PasswordIsEmptyFailure()));

    final result = await usecase.register(email: 'email', password: '');

    expect(result, isA<Left>());
  });
}
