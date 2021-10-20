import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/email_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:adote_patinhas/app/modules/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late LoginRepositoryMock repository;
  late LoginWithEmailAndPasswordUsecase usecase;
  late UserCredential userCredential;

  setUp(() {
    repository = LoginRepositoryMock();
    usecase = LoginWithEmailAndPasswordUsecaseImpl(repository: repository);
    userCredential = UserCredentialMock();
    when(() => repository.login(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(userCredential));
  });

  test('Should return an object of type Right', () async {
    final result = await usecase.login(email: 'any', password: 'any');

    expect(result, isA<Right>());
  });

  test('Should return an object of type UserCredential', () async {
    final result = await usecase.login(email: 'email', password: 'password');

    expect(result.fold(id, id), isA<UserCredential>());
  });

  test('Should give an error when email is empty', () async {
    when(() => repository.login(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Left(EmailIsEmptyFailure()));

    final result = await usecase.login(email: '', password: '123');

    expect(result.fold((failure) => failure, (userData) => userData),
        isA<EmailIsEmptyFailure>());
  });

  test('Should give an error when password is empty', () async {
    when(() => repository.login(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Left(PasswordIsEmptyFailure()));
    final result = await usecase.login(email: 'luiz@luiz.com', password: '');

    expect(result.fold((failure) => failure, (userData) => userData),
        isA<PasswordIsEmptyFailure>());
  });
}
