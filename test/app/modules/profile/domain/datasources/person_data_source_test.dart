import 'package:adote_patinhas/app/modules/profile/data/datasources/person_data_source_impl.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/person_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

void main() {
  late FirebaseFirestoreMock firestore;
  late PersonDataSource dataSource;

  setUp(() {
    firestore = FirebaseFirestoreMock();
    dataSource = PersonDataSourceImpl(firestore: firestore);
  });
  test('Should return an object of type Right', () async {
    //ARRANGE
    // when(() => firestore.collection('users').withConverter<PersonModel>(
    //       fromFirestore: (snapshot, _) => PersonModel.fromMap(snapshot.data()!),
    //       toFirestore: (person, _) => person.toMap(),
    //     )).thenAnswer((_) async=> Right(true));
    //ACT

    //ASSERT
  });
}
