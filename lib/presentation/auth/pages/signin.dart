import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/common/widgets/button/login_with_social_button.dart';
import 'package:e_commerce_app/core/configs/app_logos.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce_app/presentation/auth/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 90,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(
              context,
            ),
            const SizedBox(
              height: 20,
            ),
            _emailField(
              context,
            ),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _createAccount(context),
            const SizedBox(
              height: 20,
            ),
            LoginWithSocialButton(
              onTapped: () {},
              logoName: AppLogos.appleLogo,
              socialMediaName: "Apple",
            ),
            const SizedBox(
              height: 20,
            ),
            LoginWithSocialButton(
              onTapped: () {},
              logoName: AppLogos.googleLogo,
              socialMediaName: "Google",
            ),
            const SizedBox(
              height: 20,
            ),
            LoginWithSocialButton(
              logoName: AppLogos.facebookLogo,
              socialMediaName: "Facebook",
              onTapped: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      "Sign in",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: InputDecoration(
        hintText: "Enter email",
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have an account? ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "Create one",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  SignUpPage(),
                );
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          EnterPasswordPage(
            userSigninReq: UserSigninReq(
              email: _emailCon.text,
            ),
          ),
        );
      },
      title: "Continue",
    );
  }
}
