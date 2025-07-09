import 'package:e_commerce_app/domain/category/entity/category.dart';

abstract class CategoriesDisplayState {}

class CategoriesDisplayLoadingState extends CategoriesDisplayState {}

class CategoriesDisplayLoadedState extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesDisplayLoadedState({
    required this.categories,
  });
}

class CategoriesDisplayFailureState extends CategoriesDisplayState {}
