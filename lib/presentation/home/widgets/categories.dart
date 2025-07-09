import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _seeAll(),
        _categories(context),
      ],
    );
  }

  Widget _seeAll() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "See All",
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget _categories(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 15),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
              ),
              const SizedBox(
                height: 08,
              ),
              const Text("Text"),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
