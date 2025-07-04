import 'package:e_commerce_app/core/configs/themes/app_theme.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_app/presentation/splash/pages/splash.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
