import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/core/configs/app_vectors.dart';
import 'package:e_commerce_app/presentation/auth/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetEmailSent extends StatelessWidget {
  const ResetEmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppVectors.emailSent,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "We Sent you an Email to reset your password",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            BasicAppButton(
              width: 70,
              onPressed: () {
                AppNavigator.push(context, SigninPage());
              },
              title: "Back to Login",
            )
          ],
        ),
      ),
    );
  }
}
