import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../static_helpers/values.dart';

/// Class Representing the layout for the different sections used in the profile screen
class StudentProfileSection extends StatelessWidget {
  final String title;
  final Widget content;
  final String? icon;

  const StudentProfileSection({
    super.key,
    required this.content,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Values.paddingVerticalProfileScreen),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( // Ensures title takes available space
                child: Text(
                  title,
                  style: const TextStyle(fontSize: Values.inputTextSize, fontWeight: FontWeight.bold,),
                ),
              ),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: Values.paddingHorizontalProfileScreen),
                  child: SvgPicture.asset(
                    icon!,
                    width: Values.profileIconSize,
                    height: Values.profileIconSize,
                  ),
                ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0), // Spacing between title and content
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Values.paddingHorizontalProfileScreen), // Consistent padding
          child: Row(
            children: [
              Expanded(
                child: content,
              ),
            ],
          ),
        ),
      ],
    );
  }
}