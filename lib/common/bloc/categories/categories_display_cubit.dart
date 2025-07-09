import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app/domain/category/usecases/get_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoadingState());

  void displayCategories() async {
    var returnedData = await sl<GetCategoryUsecase>().call();
    returnedData.fold((error) {
      emit(
        CategoriesDisplayFailureState(),
      );
    }, (data) {
      emit(
        CategoriesDisplayLoadedState(
          categories: data,
        ),
      );
    });
  }
}
