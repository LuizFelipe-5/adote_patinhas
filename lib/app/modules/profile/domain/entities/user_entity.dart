abstract class UserEntity {
  String name;
  String cep;
  String city;
  String state;
  String number;

  UserEntity({
    required this.name,
    required this.number,
    required this.cep,
    required this.city,
    required this.state,
  });
}
