import 'dart:convert';

import 'package:adote_patinhas/app/modules/profile/domain/entities/user_entity.dart';

class PersonModel extends UserEntity {
  String cpf;

  PersonModel({
    required String name,
    required String cep,
    required String city,
    required String state,
    required String number,
    required this.cpf,
  }) : super(
          name: name,
          number: number,
          cep: cep,
          city: city,
          state: state,
        );

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'number': number,
      'name': name,
      'cep': cep,
      'city': city,
      'state': state,
    };
  }

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      cpf: map['cpf'],
      number: map['number'],
      name: map['name'],
      cep: map['cep'],
      city: map['city'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonModel.fromJson(String source) =>
      PersonModel.fromMap(json.decode(source));
}
