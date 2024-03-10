import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: Text("Matches"),
      ),
    );
  }
}
