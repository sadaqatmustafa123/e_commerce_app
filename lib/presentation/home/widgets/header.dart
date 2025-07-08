import 'package:e_commerce_app/core/configs/themes/app_colors.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_commerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoadingState) {
            const CircularProgressIndicator();
          }
          if (state is UserInfoDisplayLoadedState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(),
                _gender(),
                _card(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      height: 40,
      width: 40,
      decoration:
          const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
    );
  }

  Widget _gender() {
    return Container(
      height: 40,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.secondBackground,
      ),
    );
  }

  Widget _card() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primary,
      ),
      child: const Icon(
        Icons.shopping_bag,
      ),
    );
  }
}
