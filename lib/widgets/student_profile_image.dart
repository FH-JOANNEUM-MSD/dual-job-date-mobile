import 'package:flutter/material.dart';

class StudentProfileImage extends StatelessWidget {
  final String src;
  final bool updateable;
  final VoidCallback? onUpdate;

  const StudentProfileImage(
      {super.key, required this.src, this.updateable = false, this.onUpdate,});

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
        ),
        updateable
            ? Positioned(
                bottom: 0,
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Restrict column size
                      children: [
                        Text(
                          'Profilbild',
                          style:  TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                        SizedBox(
                            height: 5.0), // Add spacing between texts
                        Text(
                          'ändern',
                          style: TextStyle(
                              color: Colors.white, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
