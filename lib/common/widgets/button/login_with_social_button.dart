import 'package:e_commerce_app/core/configs/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithSocialButton extends StatelessWidget {
  final String logoName;
  final VoidCallback onTapped;
  final String socialMediaName;
  const LoginWithSocialButton({
    super.key,
    required this.logoName,
    required this.onTapped,
    required this.socialMediaName,
  });

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: AppColors.secondBackground.withOpacity(.6),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: SvgPicture.asset(
                height: 35,
                logoName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "Login with $socialMediaName",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
