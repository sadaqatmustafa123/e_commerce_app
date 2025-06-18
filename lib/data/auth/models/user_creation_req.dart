class UserCreationReq {
  String? firstName;
  String? lastName;
  String? password;
  String? email;
  int? gender;
  String? age;

  UserCreationReq({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
}
