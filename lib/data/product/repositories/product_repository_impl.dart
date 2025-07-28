import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/product/source/product_firebase_service.dart';
import 'package:e_commerce_app/domain/products/repositories/product_repository.dart';

import '../../../service_locator.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
          List.from(data).map((e) => ProductModel.fromMap(e).toEntity()));
    });
  }
}
