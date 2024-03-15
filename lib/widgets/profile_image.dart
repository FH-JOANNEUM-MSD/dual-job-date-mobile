import 'package:flutter/material.dart';

import '../static_helpers/values.dart';

/// Class Representing a round Profile image as used in Profile Screen as well as in the Update Profile Screen
/// If updatebel a overlay is displayed and the image is clickable
class ProfileImage extends StatelessWidget {
  final String src;
  final bool updateable;
  final VoidCallback? onUpdate;

  const ProfileImage({
    super.key,
    required this.src,
    this.updateable = false,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (updateable) {
          print('Image clicked!'); // TODO implement Image upload
          if (onUpdate != null) {
            onUpdate!();
          }
        }
      },
      child: Stack(
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
          if (updateable)
            Positioned(
              bottom: 0,
              child: Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.0),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Profilbild',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Values.inputTextSize,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'ändern',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Values.inputTextSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}