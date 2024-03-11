import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dual_job_date_mobile/screens/login.dart';
import 'package:dual_job_date_mobile/screens/splash.dart';
import 'package:dual_job_date_mobile/screens/studentProfile.dart';
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
        duration: 1,//3000,
        splash: const Splash(),
        nextScreen: const StudentProfile(name: 'Elisabeth', program: 'MSD', about: 'test', skills: ['Python', 'SQL', 'Netzwerktechnik', 'Design', 'Java', ' Kotlin']),
      ),
    );
  }
}
