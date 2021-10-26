import 'package:adote_patinhas/app/commons/failures/unknown_failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:adote_patinhas/app/core/failure.dart';
import 'package:adote_patinhas/app/modules/profile/data/models/legal_person_model.dart';
import 'package:adote_patinhas/app/modules/profile/domain/datasources/legal_person_data_source.dart';

class LegalPersonDataSourceImpl implements LegalPersonDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  LegalPersonDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<Either<Failure, bool>> register(
      {required LegalPersonModel legalPerson}) async {
    try {
      CollectionReference users =
          firestore.collection('users').withConverter<LegalPersonModel>(
                fromFirestore: (snapshot, _) =>
                    LegalPersonModel.fromMap(snapshot.data()!),
                toFirestore: (legalPerson, _) => legalPerson.toMap(),
              );
      await users.add(legalPerson);
      return const Right(true);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
