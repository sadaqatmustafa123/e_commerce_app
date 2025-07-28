import 'package:e_commerce_app/presentation/home/widgets/categories.dart';
import 'package:e_commerce_app/presentation/home/widgets/header.dart';
import 'package:e_commerce_app/presentation/home/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 14,
              ),
              SearchField(),
              SizedBox(
                height: 14,
              ),
              CategoriesWidget(),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
