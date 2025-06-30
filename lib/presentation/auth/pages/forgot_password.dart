import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app/domain/usecases/send_password_reset_email.dart';
import 'package:e_commerce_app/presentation/auth/pages/reset_email_sent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSuccessState) {
              var successSnackbar = const SnackBar(
                content: Text(
                  "Password reset email sent",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
            }
          },
          child: Padding(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      "Forgot Password",
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
                usecase: SendPasswordResetEmailUsecase(),
                params: _emailCon.text,
              );
          AppNavigator.push(context, const ResetEmailSent());
        },
        title: "Continue",
      );
    });
  }
}
