import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../static_helpers/paths.dart';
import '../static_helpers/values.dart';

class StudentProfileUpload extends StatelessWidget {
  final List<String> files;
  final String icon;
  final bool updateable;
  final VoidCallback? onDelete; // Optional callback for delete action

  const StudentProfileUpload({
    super.key,
    required this.files,
    required this.icon,
    this.updateable = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: files.length,
      itemBuilder: (context, index) {
        final uploadItem = files[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: Values.profileIconSize,
                height: Values.profileIconSize,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  uploadItem,
                  style: const TextStyle(fontSize: Values.inputTextSize, fontFamily: StaticStrings.font,), // Defined font size
                ),
              ),
              if (updateable) // Check if updateable and onDelete provided
                IconButton(
                  icon: SvgPicture.asset(
                    Paths.trash,
                    width: Values.profileIconSize,
                    height: Values.profileIconSize,
                  ),
                  onPressed: onDelete,
                ),
            ],
          ),
        );
      },
    );
  }
}