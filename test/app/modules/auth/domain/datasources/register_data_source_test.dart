import 'package:adote_patinhas/app/modules/auth/data/datasources/register_data_source.impl.dart';
import 'package:adote_patinhas/app/modules/auth/domain/datasources/register_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class UserCredentialMock extends Mock implements UserCredential {}

void main() {
  late FirebaseAuthMock firebaseAuth;
  late UserCredentialMock userCredential;
  late RegisterDataSource dataSource;

  setUp(() {
    firebaseAuth = FirebaseAuthMock();
    userCredential = UserCredentialMock();
    dataSource = RegisterDataSourceImpl(firebaseAuth: firebaseAuth);
  });

  test('Should return an object of type Right', () async {
    when(() => firebaseAuth.createUserWithEmailAndPassword(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => userCredential);

    final result =
        await dataSource.register(email: 'email', password: 'password');

    expect(result, isA<Right>());
  });
}
