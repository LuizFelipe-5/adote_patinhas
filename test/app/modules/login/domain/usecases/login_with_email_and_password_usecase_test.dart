import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/login/domain/repositories/login_repository.dart';
import 'package:adote_patinhas/app/modules/login/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final usecase = LoginWithEmailAndPasswordUsecaseImpl(repository: repository);

  // test('Deve retornar um UserCredential', () async {
  //   when(repository.login(email: 'any', password: 'any')).thenAnswer((_) async => Right());

  //   final result = await usecase.login('any', 'any');
  //   expect(result | null, isA<UserCredential>);
  // });
}
