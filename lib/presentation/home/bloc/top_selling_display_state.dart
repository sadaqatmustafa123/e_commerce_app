import 'package:e_commerce_app/domain/products/entitites/product_entity.dart';

abstract class TopSellingDisplayState {}

class ProductsLoading extends TopSellingDisplayState {}

class ProductsLoaded extends TopSellingDisplayState {
  final List<ProductEntity> products;

  ProductsLoaded({required this.products});
}

class LoadProductsFailure extends TopSellingDisplayState {}
