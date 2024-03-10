import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dual_job_date_mobile/screens/login.dart';
import 'package:dual_job_date_mobile/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
          splash: Image.asset("assets/images/logo.png"),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: const Color(0xFF5F8923),
          nextScreen: const Login(),
      ),
    );
  }
}
