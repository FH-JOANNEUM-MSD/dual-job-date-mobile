import 'dart:async';
import 'package:dual_job_date_mobile/screens/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color> [
            Color(0xFFF2FFE4),
            Color(0xFF73B72A)
          ]
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Image.asset('assets/images/logo.png'),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 40),
              child: DefaultTextStyle(
                  style: TextStyle(color: Colors.white, fontSize: 40),
                  child: Text("DUAL DATING")
              ),
            ),
          ),
        ]
      ),
    );
  }
}
