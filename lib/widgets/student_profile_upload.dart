import 'package:flutter/material.dart';

class StudentProfileUpload extends StatelessWidget {
  final List<String> files;
  final String icon;

  const StudentProfileUpload({super.key, required this.files, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final uploadItem = files[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 15.0,
                height: 15.0,
              ),
              const SizedBox(width: 8.0),
              Text(uploadItem),
            ],
          ),
        );
      },
    );
  }
}
