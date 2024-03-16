
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dual_job_date_mobile/screens/login.dart';
import 'package:dual_job_date_mobile/screens/splash.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Values.setScreenWidth(MediaQuery.of(context).size.width);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splashIconSize: MediaQuery.of(context).size.height,
          splash: const Splash(),
          nextScreen: const Login(),
        ));
  }
}
