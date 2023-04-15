import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'features/splash/presentation/splash_view.dart';

void main() {
  runApp(const BrailleApp());
}

class BrailleApp extends StatelessWidget {
  const BrailleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}