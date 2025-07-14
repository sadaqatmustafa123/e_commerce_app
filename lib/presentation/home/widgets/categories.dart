import 'package:e_commerce_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_app/domain/category/entity/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, categoriesState) {
          if (categoriesState is CategoriesDisplayLoadingState) {
            return const CircularProgressIndicator.adaptive();
          }
          if (categoriesState is CategoriesDisplayLoadedState) {
            return Column(
              children: [
                _seeAll(),
                _categories(
                  categoriesState.categories,
                ),
              ],
            );
          }
          return Container();
        },
      ),
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

  Widget _categories(List<CategoryEntity> categories) {
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
              Text(
                categories[index].title,
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
      ),
    );
  }
}
