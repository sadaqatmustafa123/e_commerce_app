import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({
    dynamic params,
    required Usecase usecase,
  }) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(
        params: params,
      );
      returnedData.fold(
        (error) {
          emit(ButtonFailureState());
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState());
    }
  }
}
