class UserCreationReq {
  String? password;
  String? email;

  UserCreationReq({
    required this.email,
    required this.password,
  });
}
