import 'package:dual_job_date_mobile/widgets/custom_dropdown_profile.dart';
import 'package:dual_job_date_mobile/widgets/custom_elevated_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field_profile.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/widgets/profile_image.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_section.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_skill_chips.dart';
import 'package:dual_job_date_mobile/widgets/student_profile_upload.dart';

import '../models/student.dart';
import '../widgets/custom_form_padding.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentProfileUpdate extends StatelessWidget {
  final Student mockStudent;

  const StudentProfileUpdate({super.key, required this.mockStudent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StaticProfileStrings.profileTitle),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Paths.close,
              width: Values.profileIconSize,
              height: Values.profileIconSize,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text(StaticStrings.cancelButtonText),
                      content: const Text(StaticProfileStrings.confirmCancel),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text(
                            'Nein',
                            style: TextStyle(color: StaticColors.primary,),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            Navigator.pop(context);

                          },
                          child: const Text(
                            'Ja',
                            style: TextStyle(
                              color: StaticColors.primary,
                              fontSize: Values.inputTextSize,
                            ),
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
            ProfileImage(
              src: mockStudent.image,
              updateable: true,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Values.paddingHorizontalProfileScreen,
                  bottom: Values.paddingVerticalProfileScreen),
              child: Column(
                children: [
                  CustomTextFormFieldProfile(
                    //controller: TextEditingController(),
                    hintText: StaticProfileStrings.updateNameHint,
                    initialValue: mockStudent.name,
                    fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText,
                  ),
                  CustomDropdownProfile(hintText: StaticProfileStrings.updateProgramHint, items: ['Mobile Software Development','Wirtschaftsinformatik'], fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText, initialValue: mockStudent.program,),
                  CustomTextFormFieldProfile(
                    hintText: StaticProfileStrings.aboutMeHint,
                    initialValue: mockStudent.aboutMe,
                    fillColor: StaticColors.lightGreyTextBox,
                    textColor: StaticColors.darkGreyTextBoxText,
                    maxLines: 7,
                    maxLength: 500,
                  ),
                  StudentProfileSection(
                      title: StaticProfileStrings.skills,
                      content: StudentProfileSkillChipsUpdate(
                          chipColor: StaticColors.buttonColor,
                          skills: mockStudent.skills)),
                  StudentProfileSection(
                      title: StaticProfileStrings.documents,
                      icon: Paths.archive,
                      content: StudentProfileUpload(
                        files: mockStudent.uploads,
                        icon: Paths.document,
                        updateable: true,
                      )),
                  CustomFormPadding(
                    topHeaderDistance: Values.paddingInsetButtonTop,
                    childWidget: CustomElevatedButton(
                      text: StaticStrings.saveButtonText,
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
