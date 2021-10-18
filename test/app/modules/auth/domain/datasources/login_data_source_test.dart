import 'package:adote_patinhas/app/modules/auth/domain/datasources/login_data_source.dart';
import 'package:adote_patinhas/app/modules/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late LoginDataSourceMock dataSource;
  late FirebaseAuthMock firebaseAuth;
  late UserCredential userCredential;

  setUp(() {
    userCredential = UserCredentialMock();
    dataSource = LoginDataSourceMock();
    firebaseAuth = FirebaseAuthMock();
  });

  test('Deveria retornar um obj do tipo Right', () async {
    when(() => firebaseAuth.signInWithEmailAndPassword(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => userCredential);

    final result = await dataSource.login(email: 'email', password: 'password');

    expect(result, isA<Right>());
  });
}
