import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_image.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_section.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_skill_chips.dart';
import 'package:dual_job_date_mobile/widgets/divider.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_upload.dart';

class StudentProfile extends StatelessWidget {
  final String name;
  final String program;
  final String about;
  final List<String> skills;
  final List<String> uploadItems;

  const StudentProfile({
    super.key,
    required this.name,
    required this.program,
    required this.about,
    required this.skills,
    required this.uploadItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: Image.asset(
            StaticStrings.edit,
            width: 40.0,
            height: 40.0,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text('Profil bearbeiten'),
                      content: const Text('Profil wirklich bearbeiten?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text(
                            'Abbrechen',
                            style: TextStyle(color: StaticColors.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            print('Edit confirmed');
                          },
                          child: const Text(
                            'Bearbeiten',
                            style: TextStyle(color: StaticColors.primary),
                          ),
                        ),
                      ]);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StudentProfileImage(src: 'assets/images/placeholder.png'),
            ProfileHeader(),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(title: 'Über mich', content: Text(about)),
            const CustomDivider(color: StaticColors.primary),
            SkillsSection(),
            const CustomDivider(color: StaticColors.primary),
           const StudentProfileSection(title: 'Uploads:', content: StudentProfileUpload(files: ['test'], icon: StaticStrings.document)),
          ],
        ),
      ),
    );
  }

  Widget ProfileHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            program,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget SkillsSection() {
    const chipColors = [
      StaticColors.pinkChip,
      StaticColors.blueChip,
      StaticColors.greenChip,
      StaticColors.orangeChip,
      StaticColors.redChip,
      StaticColors.yellowChip,
    ];

    return StudentProfileSection(
        title: 'Kenntnisse',
        content: Wrap(
          spacing: 5,
          runSpacing: 0,
          children: skills
              .asMap()
              .entries
              .map((entry) =>
              StudentProfileSkillChips(index: entry.key, skill: entry.value, colors: chipColors))
              .toList(),
        ),
    );
  }

}
