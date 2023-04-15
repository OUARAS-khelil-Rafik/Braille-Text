import 'package:flutter/material.dart';

import 'widgets/splash_body.dart';



class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF2BB4FF).withOpacity(0.7),
      body: const SplashViewBody(),
    );
  }
}