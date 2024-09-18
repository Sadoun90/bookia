import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/themes.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia/features/auth/presentation/page/Password_Changed.dart';
import 'package:bookia/features/auth/presentation/page/login_view.dart';
import 'package:bookia/features/intro/splash_view.dart';
import 'package:bookia/features/intro/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioProvider.init();
  await LocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.LightTheme,
          home: const SplashView()),
    );
  }
}
