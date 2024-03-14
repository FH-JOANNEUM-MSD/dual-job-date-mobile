import 'package:flutter/material.dart';

import '../static_helpers/paths.dart';

class StudentProfileUpload extends StatelessWidget {
  final List<String> files;
  final String icon;
  final bool updateable;

  const StudentProfileUpload(
      {super.key, required this.files, required this.icon, this.updateable = false});

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
            // Use Expanded to fill remaining space
            children: [
              Image.asset(
                icon,
                width: 24.0,
                height: 24.0,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  uploadItem,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              updateable
                  ?
              Image.asset(
                Paths.trash,
                width: 24.0, // Adjust width and height as needed
                height: 24.0, // Adjust width and height as needed
              ) : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}