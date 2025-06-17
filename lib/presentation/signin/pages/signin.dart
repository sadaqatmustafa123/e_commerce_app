import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            _createAccount(context),
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
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter email",
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(text: "Don't you have an account? "),
          TextSpan(
              text: "Create one",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
