import 'package:e_commerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Icon(
          Icons.home_filled,
          size: 50,
        ),
      ),
    );
  }
}
