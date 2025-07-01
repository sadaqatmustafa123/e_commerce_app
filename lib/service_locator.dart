import 'package:e_commerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/usecases/get_ages_usecase.dart';
import 'package:e_commerce_app/domain/usecases/is_logged_in.dart';
import 'package:e_commerce_app/domain/usecases/send_password_reset_email.dart';
import 'package:e_commerce_app/domain/usecases/signin_usecase.dart';
import 'package:e_commerce_app/domain/usecases/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  // Usecases

  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );

  sl.registerSingleton<GetAgesUsecase>(
    GetAgesUsecase(),
  );

  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );

  sl.registerSingleton<SendPasswordResetEmailUsecase>(
    SendPasswordResetEmailUsecase(),
  );

  sl.registerSingleton<IsLoggedIn>(
    IsLoggedIn(),
  );
}
