import 'package:flutter/material.dart';

class StudentProfileImage extends StatelessWidget {
  final String src;

  const StudentProfileImage({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(90.0),
          child: SizedBox(
            width: 180.0,
            height: 180.0,
            child: Image.asset(
              src,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
