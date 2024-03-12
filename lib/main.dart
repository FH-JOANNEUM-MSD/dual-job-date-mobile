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
        nextScreen: const StudentProfile(name: 'Lisa', program: 'Mobile Software Development', about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', skills: ['Python', 'SQL', 'Netzwerktechnik', 'Design', 'Java', ' Kotlin'], uploadItems: ['Lebenslauf', 'Zertifikate', 'Weitere Dokumente'],),
      ),
    );
  }
}
