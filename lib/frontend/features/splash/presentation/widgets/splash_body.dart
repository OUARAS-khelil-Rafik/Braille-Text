import 'package:braille_text/frontend/Pages/transcriptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (ctx) => const Transcriptor())
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Braille Translation',
          style: TextStyle(
            fontFamily: 'now',
            fontSize: 51,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
        Image.asset('assets/images/LogoApp.png'),
      const SpinKitThreeInOut(
        color: Colors.white,
        size: 60.0,
      ),
      ],
    );
  }
}