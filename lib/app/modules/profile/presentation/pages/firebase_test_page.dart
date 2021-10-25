import 'package:adote_patinhas/app/modules/profile/data/models/person_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTest extends StatefulWidget {
  const FirebaseTest({Key? key}) : super(key: key);

  @override
  _FirebaseTestState createState() => _FirebaseTestState();
}

class _FirebaseTestState extends State<FirebaseTest> {
  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore.instance.collection('users').get().then((value) {
    //   value.docs.forEach((element) {
    //     print(element.data());
    //   });
    // });
    _register(PersonModel(
        name: 'Luiz',
        cep: '37',
        city: 'tp',
        state: 'mg',
        cpf: '000',
        number: '999'));
    return Container();
  }
}

_register(PersonModel person) async {
  CollectionReference users = FirebaseFirestore.instance
      .collection('users')
      .withConverter<PersonModel>(
        fromFirestore: (snapshot, _) => PersonModel.fromMap(snapshot.data()!),
        toFirestore: (person, _) => person.toMap(),
      );

  users.add(person);
}
