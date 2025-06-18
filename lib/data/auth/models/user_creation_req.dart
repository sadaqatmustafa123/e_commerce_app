class UserCreationReq {
  String? firstName;
  String? lastName;
  String? password;
  String? email;

  UserCreationReq({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });
}
