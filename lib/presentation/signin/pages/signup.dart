import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_app/presentation/signin/pages/enter_password.dart';
import 'package:e_commerce_app/presentation/signin/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 00,
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
            _firstNameField(
              context,
            ),
            const SizedBox(
              height: 20,
            ),
            _lastNameField(
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
            _passwordField(
              context,
            ),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _forgotPassword(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      "Create Account",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Password",
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Email address",
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Firstname",
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Lastname",
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Forgot password? "),
          TextSpan(
            text: "Reset",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(
                  context,
                  const ForgotPasswordPage(),
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
          const EnterPasswordPage(),
        );
      },
      title: "Continue",
    );
  }
}
