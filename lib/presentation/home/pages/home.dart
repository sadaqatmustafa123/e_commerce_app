import 'package:e_commerce_app/domain/usecases/get_user_usecase.dart';
import 'package:e_commerce_app/presentation/home/widgets/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [Header(), Text("$GetUserUsecase")],
          ),
        ),
      ),
    );
  }
}
