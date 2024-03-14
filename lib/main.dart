import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dual_job_date_mobile/screens/login.dart';
import 'package:dual_job_date_mobile/screens/splash.dart';
import 'package:dual_job_date_mobile/tabs/appointments.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Appointments(),
    );
  }
}
