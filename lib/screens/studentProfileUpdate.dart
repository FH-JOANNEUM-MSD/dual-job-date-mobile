import 'package:dual_job_date_mobile/widgets/custom_elevated_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field_profile.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_image.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_section.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_skill_chips.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_upload.dart';

import '../static_helpers/values.dart';
import '../widgets/custom_form_padding.dart';

class StudentProfileUpdate extends StatelessWidget {
  final String name;
  final String program;
  final String about;
  final List<String> skills;
  final List<String> uploadItems;

  const StudentProfileUpdate({
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
              Paths.close,
              width: 40.0,
              height: 40.0,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text('Abbrechen'),
                      content: const Text('Profil wirklich abbrechen?'),
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
            const StudentProfileImage(
              src: 'assets/images/placeholder.png',
              updateable: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Column(
                children: [
                  CustomTextFormFieldProfile(
                    controller: TextEditingController(),
                    hintText: 'Vorname Nachname',
                    fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText,
                  ),
                  CustomTextFormFieldProfile(
                    controller: TextEditingController(),
                    hintText: 'Studiengang',
                    fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText,
                  ),
                  CustomTextFormFieldProfile(
                    controller: TextEditingController(),
                    hintText: 'Schreibe Etwas Über Dich ...',
                    fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText,
                    maxLines: 7,
                    maxLength: 500,
                  ),
                  StudentProfileSection(
                      title: 'Kenntnisse',
                      content: StudentProfileSkillChipsUpdate(
                          chipColor: StaticColors.buttonColor, skills: skills)),
                  StudentProfileSection(
                      title: 'Uploads:',
                      icon: Paths.archive,
                      content: StudentProfileUpload(
                          files: uploadItems, icon: Paths.document, updateable: true, )),
                  CustomFormPadding(
                    topHeaderDistance: Values.paddingInsetButtonTop,
                    childWidget: CustomElevatedButton(
                      text: 'SPEICHERN',
                      onPressed: () {
                        //TODO: implement me...
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

