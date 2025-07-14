import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class SigninUsecase implements Usecase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
