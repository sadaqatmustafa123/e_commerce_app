import 'package:e_commerce_app/domain/auth/entity/user.dart';

abstract class UserInfoDisplayState {}

class UserInfoDisplayLoadedState extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoDisplayLoadedState({
    required this.user,
  });
}

class UserInfoDisplayLoadingState extends UserInfoDisplayState {}

class UserInfoDisplayFailureState extends UserInfoDisplayState {}
