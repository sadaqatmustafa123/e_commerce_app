import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreationReq user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
