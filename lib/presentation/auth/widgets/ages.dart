import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commerce_app/presentation/auth/bloc/ages_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return _ages(
              state.ages,
            );
          }
          if (state is AgesLoadFailure) {
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Text(
          ages[index].data()["value"],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
      itemCount: ages.length,
    );
  }
}
