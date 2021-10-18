import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/failures/password_is_empty_failure.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:adote_patinhas/app/modules/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginWithEmailAndPasswordUsecaseImpl(repository: repository);

  UserCredential userCredential;

  test('Deveria efetuar login', () async {
    when(() =>
            repository.login(CredentialsParams(email: 'any', password: 'any')))
        .thenAnswer((_) async => Right(UserCredential));

    final result = await usecase
        .login(CredentialsParams(email: 'luiz@luiz.com', password: '123'));

    expect(result, isA<UserCredential>());
    // expect(result.fold((l) => null, (r) => null), matcher)
  });

  test('Deveria dar erro quando o email for vazio', () async {
    final result = await usecase
        .login(CredentialsParams(email: 'luiz@luiz.com', password: '123'));

    expect(result, isA<UserCredential>());
  });

  test('Deveria dar erro quando a senha for vazio', () async {
    final result = usecase
        .login(CredentialsParams(email: 'luiz@luiz.com', password: '123'));

    expect(() async => await Right(result),
        throwsA(isA<PasswordIsEmptyFailure>()));
  });
}
