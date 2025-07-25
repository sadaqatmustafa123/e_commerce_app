class UserEntity {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final int gender;
  final String image;

  UserEntity({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.image,
  });
}
// domain layer acts as medium wall 