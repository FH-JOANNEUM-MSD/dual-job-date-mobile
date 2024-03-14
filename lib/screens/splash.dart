import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
      child: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
        ),
      ),
    );
  }
}
