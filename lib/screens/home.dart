import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: const Center(
        child: DefaultTextStyle(
            style: TextStyle(color: Colors.black, fontSize: 24),
            child: Text("Place Holder for Home")),
      ),
    );
  }
}
