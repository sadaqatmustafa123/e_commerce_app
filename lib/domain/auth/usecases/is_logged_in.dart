import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';

import '../../../service_locator.dart';

class IsLoggedIn implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
