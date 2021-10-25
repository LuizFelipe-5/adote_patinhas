abstract class UserEntity {
  String name;
  String cep;
  String city;
  String state;

  UserEntity({
    required this.name,
    required this.cep,
    required this.city,
    required this.state,
  });
}
