import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signUp(
    UserCreationReq user,
  );
  Future<Either> signIn(
    UserCreationReq user,
  );
  Future<Either> getAges();
}
