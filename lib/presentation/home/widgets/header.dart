import 'package:e_commerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        _gender(),
        _card(),
      ],
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
      child: Icon(
        Icons.shopping_bag,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.primary,
      ),
    );
  }
}
