import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class SendPasswordResetEmailUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
