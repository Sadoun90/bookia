import 'package:bookia/core/utils/themes.dart';
import 'package:bookia/features/auth/presentation/page/Password_Changed.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:bookia/features/intro/splash_view.dart';
import 'package:bookia/features/intro/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.LightTheme,
        home: const SplashView());
  }
}
