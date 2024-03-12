import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/paths.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_form_padding.dart';

/// Screen for changing your password
class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

/// State Class: Needed for stateful widget
class _SetNewPasswordState extends State<SetNewPassword> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatNewPasswordController =
      TextEditingController();

  ///Destructor
  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();
    super.dispose();
  }

  ///Actually build the widget
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, //Full size the container
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            //Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              StaticColors.topBackgroundScreen,
              StaticColors.bottomBackgroundScreen,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomFormPadding(
              topHeaderDistance: Values.paddingLogoTop,
              childWidget: Image.asset(
                //Logo Image
                Paths.logo,
                height: Values.getScaledLogoSize(),
              ),
            ),
            const CustomFormPadding(
              topHeaderDistance: Values.paddingTitleTop,
              childWidget: Text(
                //Title of the screen
                StaticStrings.changePassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Values.screenTitleTextSize,
                ),
              ),
            ),
            Expanded(
                child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  //Form consisting of 3 Text inputs and one button
                  CustomFormPadding(
                    //Current Password Text Field
                    childWidget: CustomTextFormField(
                      controller: _currentPasswordController,
                      hintText: StaticStrings.currentPasswordText,
                      isHidden: true,
                    ),
                  ),
                  CustomFormPadding(
                    //New Password Text Field
                    childWidget: CustomTextFormField(
                      controller: _newPasswordController,
                      hintText: StaticStrings.newPasswordText,
                      isHidden: true,
                    ),
                  ),
                  CustomFormPadding(
                    //Repeat new Password Text Field
                    childWidget: CustomTextFormField(
                      controller: _repeatNewPasswordController,
                      hintText: StaticStrings.repeatNewPasswordText,
                      isHidden: true,
                    ),
                  ),
                  CustomFormPadding(
                    // Save Button
                    childWidget: CustomElevatedButton(
                      text: StaticStrings.saveButtonText,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          navigateToHome(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Home()));
  }
}

