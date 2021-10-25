import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/person_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PersonDataSourceImpl implements PersonDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  PersonDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<Either<Failure, bool>> register({required PersonModel person}) async {
    try {
      CollectionReference users =
          firestore.collection('users').withConverter<PersonModel>(
                fromFirestore: (snapshot, _) =>
                    PersonModel.fromMap(snapshot.data()!),
                toFirestore: (person, _) => person.toMap(),
              );
      await users.add(person);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
