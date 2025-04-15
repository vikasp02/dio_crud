import 'package:dio_crud/api_services/dio_handler.dart';
import 'package:dio_crud/screens/login_screen.dart';
import 'package:dio_crud/screens/splash_screen.dart';
import 'package:dio_crud/view_models/auth_view_model.dart';
import 'package:dio_crud/view_models/faqs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  DioHandler.setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => AuthViewModel()),
        ChangeNotifierProvider(create: (ctx) => FaqsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}
