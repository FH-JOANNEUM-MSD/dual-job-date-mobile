import 'package:dual_job_date_mobile/data/mockStudent.dart';
import 'package:dual_job_date_mobile/screens/studentProfileUpdate.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/widgets/profile_image.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_section.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_skill_chips.dart';
import 'package:dual_job_date_mobile/widgets/divider.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_upload.dart';
import 'package:flutter_svg/svg.dart';
import '../static_helpers/values.dart';
import '../static_helpers/strings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
        title: const Text(StaticProfileStrings.profileTitle),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Paths.edit,
              width: Values.profileIconSize,
              height: Values.profileIconSize,
            ),
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentProfileUpdate(mockStudent: mockStudent),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(src: mockStudent.image),
            profileHeader(),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(
                title: StaticProfileStrings.aboutMe,
                content: Text(
                  mockStudent.aboutMe,
                  style: const TextStyle(
                    fontSize: Values.inputTextSize,
                  ),
                )),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(
                title: StaticProfileStrings.skills,
                content: StudentProfileSkillChips(
                    colors: chipColors, skills: mockStudent.skills)),
            const CustomDivider(color: StaticColors.primary),
            StudentProfileSection(
                title: StaticProfileStrings.documents,
                content: StudentProfileUpload(
                    files: mockStudent.uploads, icon: Paths.document)),
          ],
        ),
      ),
    );
  }

  Widget profileHeader() {
    return Padding(
      padding: const EdgeInsets.only(
          top: Values.paddingHorizontalProfileScreen,
          bottom: Values.paddingVerticalProfileScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mockStudent.name,
            style: const TextStyle(
              fontSize: Values.headingTextSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            mockStudent.program,
            style: const TextStyle(
                fontSize: Values.inputTextSize,
                color: StaticColors.darkGreyTextBoxText),
          ),
        ],
      ),
    );
  }
}
