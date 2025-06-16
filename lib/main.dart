import 'package:e_commerce_app/core/configs/themes/app_theme.dart';
import 'package:e_commerce_app/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
