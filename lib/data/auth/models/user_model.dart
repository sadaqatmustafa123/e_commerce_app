import 'package:e_commerce_app/domain/auth/entity/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      gender: json['gender'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'gender': gender,
    };
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
    );
  }
}
