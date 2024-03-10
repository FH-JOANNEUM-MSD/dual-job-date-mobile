import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF5F8923),
      ),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Image.asset('assets/images/logo.png'),
          const DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontSize: 40),
              child: Text("DUAL DATING")
          ),
        ]
      ),
    );
  }
}
