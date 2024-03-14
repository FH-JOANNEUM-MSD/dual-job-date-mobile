import 'package:flutter/material.dart';

class StudentProfileSection extends StatelessWidget {
  final String title;
  final Widget content;
  final String? icon;

  const StudentProfileSection(
      {super.key, required this.content, required this.title, this.icon});

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
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(), // Add Spacer for right alignment
                if (icon != null) // Check if icon is provided
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(
                      icon!,
                      width: 24.0,
                      height: 24.0, // Adjust width and height as needed
                    ),
                  ),
              ]),
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
