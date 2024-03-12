import 'package:flutter/material.dart';

class StudentProfileSection extends StatelessWidget {
  final String title;
  final Widget content;

  const StudentProfileSection({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: content,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
