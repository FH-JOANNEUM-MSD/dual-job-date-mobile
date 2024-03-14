import 'package:dual_job_date_mobile/screens/studentProfileUpdate.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
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
    const chipColors = [
      StaticColors.pinkChip,
      StaticColors.blueChip,
      StaticColors.greenChip,
      StaticColors.orangeChip,
      StaticColors.redChip,
      StaticColors.yellowChip,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: Image.asset(
              Paths.edit,
              width: 40.0,
              height: 40.0,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentProfileUpdate(
                            name: 'Lisa',
                            program: 'Mobile Software Development',
                            about:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            skills: [
                              'Python',
                              'SQL',
                              'Netzwerktechnik',
                              'Design',
                              'Java',
                              ' Kotlin'
                            ],
                            uploadItems: [
                              'Lebenslauf',
                              'Zertifikate',
                              'Weitere Dokumente'
                            ])),
              );
              /*showDialog(
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
                      ]);*/
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
            StudentProfileSection(
                title: 'Über mich',
                content: Text(
                  about,
                  style: const TextStyle(fontSize: 16),
                )),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(
                title: 'Kenntnisse',
                content: StudentProfileSkillChips(
                    colors: chipColors, skills: skills)),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(
                title: 'Uploads:',
                content: StudentProfileUpload(
                    files: uploadItems, icon: Paths.document)),
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
            style: const TextStyle(
                fontSize: 16, color: StaticColors.darkGreyTextBoxText),
          ),
        ],
      ),
    );
  }
}
