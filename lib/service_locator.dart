import 'package:e_commerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_app/data/category/repository/category_repository_impl.dart';
import 'package:e_commerce_app/data/category/source/category_firebase_service.dart';
import 'package:e_commerce_app/data/product/repositories/product_repository_impl.dart';
import 'package:e_commerce_app/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commerce_app/domain/category/repository/category_repository.dart';
import 'package:e_commerce_app/domain/category/usecases/get_category_usecase.dart';
import 'package:e_commerce_app/domain/auth/usecases/get_ages_usecase.dart';
import 'package:e_commerce_app/domain/auth/usecases/get_user_usecase.dart';
import 'package:e_commerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:e_commerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:e_commerce_app/domain/auth/usecases/signin_usecase.dart';
import 'package:e_commerce_app/domain/auth/usecases/signup_usecase.dart';
import 'package:e_commerce_app/domain/products/repositories/product_repository.dart';
import 'package:e_commerce_app/domain/products/usecases/get_top_selling_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<CategoryFirebaseService>(
    CategoryFirebaseServiceImpl(),
  );

  sl.registerSingleton<ProductFirebaseService>(
    ProductFirebaseServiceImpl(),
  );

  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<ProductRepository>(
    ProductRepositoryImpl(),
  );

  sl.registerSingleton<CategoryRepository>(
    CategoryRepositoryImpl(),
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

  sl.registerSingleton<GetUserUsecase>(
    GetUserUsecase(),
  );

  sl.registerSingleton<GetCategoryUsecase>(
    GetCategoryUsecase(),
  );

  sl.registerSingleton<GetTopSellingUsecase>(
    GetTopSellingUsecase(),
  );
}
