import 'package:e_commerce_app/domain/auth/usecases/get_user_usecase.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service_locator.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit()
      : super(
          UserInfoDisplayLoadingState(),
        );

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUsecase>().call();
    returnedData.fold((error) {
      emit(
        UserInfoDisplayFailureState(),
      );
    }, (data) {
      emit(UserInfoDisplayLoadedState(
        user: data,
      ));
    });
  }
}
