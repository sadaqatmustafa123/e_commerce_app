import 'package:e_commerce_app/presentation/home/bloc/top_selling_display_cubit.dart';
import 'package:e_commerce_app/presentation/home/bloc/top_selling_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/product/product_card.dart';
import '../../../domain/products/entitites/product_entity.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopSellingDisplayCubit>(
      create: (context) => TopSellingDisplayCubit()..displayProducts(),
      child: BlocBuilder<TopSellingDisplayCubit, TopSellingDisplayState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _topSelling(),
                const SizedBox(
                  height: 20,
                ),
                _products(state.products),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _topSelling() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        'Top Selling',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: products.length),
    );
  }
}
