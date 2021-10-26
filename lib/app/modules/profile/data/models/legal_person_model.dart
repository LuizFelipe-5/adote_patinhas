import 'dart:convert';

import 'package:adote_patinhas/app/modules/profile/domain/entities/user_entity.dart';

class LegalPersonModel extends UserEntity {
  String cnpj;

  LegalPersonModel({
    required String name,
    required String cep,
    required String city,
    required String state,
    required String number,
    required this.cnpj,
  }) : super(
          name: name,
          number: number,
          cep: cep,
          city: city,
          state: state,
        );

  Map<String, dynamic> toMap() {
    return {
      'cnpj': cnpj,
      'name': name,
      'number': number,
      'cep': cep,
      'city': city,
      'state': state,
    };
  }

  factory LegalPersonModel.fromMap(Map<String, dynamic> map) {
    return LegalPersonModel(
      cnpj: map['cnpj'],
      number: map['number'],
      name: map['name'],
      cep: map['cep'],
      city: map['city'],
      state: map['state'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LegalPersonModel.fromJson(String source) =>
      LegalPersonModel.fromMap(json.decode(source));
}
