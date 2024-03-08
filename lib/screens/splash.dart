import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: DefaultTextStyle(
            style: TextStyle(color: Colors.black, fontSize: 24),
            child: Text("Place Holder for Splash")),
      ),
    );
  }
}
