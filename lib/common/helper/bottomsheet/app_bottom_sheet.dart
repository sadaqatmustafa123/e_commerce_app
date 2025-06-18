import 'package:flutter/material.dart';

class AppBottomSheet {
  Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return widget
        },);
  }
}
