import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_app/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_app/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_app/domain/usecases/signin_usecase.dart';
import 'package:e_commerce_app/presentation/auth/pages/forgot_password.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq userSigninReq;
  EnterPasswordPage({
    super.key,
    required this.userSigninReq,
  });

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 00,
          ),
          child: BlocProvider(
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
                      "Sign in successful",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
                }
              },
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
                  _forgotPassword(context),
                ],
              ),
            ),
          ),
        ));
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
        hintText: "Enter password",
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
                  ForgotPasswordPage(),
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
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          userSigninReq.password = _passwordCon.text;
          context.read<ButtonStateCubit>().execute(
                usecase: SigninUsecase(),
                params: userSigninReq,
              );
        },
        title: "Continue",
      );
    });
  }
}
