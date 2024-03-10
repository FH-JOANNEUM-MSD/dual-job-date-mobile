import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView( //Make the app scrollable
            child: Container(
              height: MediaQuery.of(context).size.height, //Full size the container
              decoration: const BoxDecoration(
                gradient: LinearGradient( //Background gradient
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
                Image.asset( //Logo Image
                  StaticStrings.logo,
                  height: Values.logoImageWidthHeight_200,
                  width: Values.logoImageWidthHeight_200,
                ),
                const Text( //Title of the screen
                  StaticStrings.changePassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Values.headerTextSize_24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Form consisting of 3 Text inputs and one button
                CustomFormPadding( //Current Password Text Field
                    childWidget: CustomTextFormField(
                        controller: _currentPasswordController,
                        hintText: CustomTextFormField.currentPasswordText,
                    ),
                ),
            CustomFormPadding( //New Password Text Field
                childWidget: CustomTextFormField(
                  controller: _newPasswordController,
                  hintText: CustomTextFormField.newPasswordText,
                ),
            ),
            CustomFormPadding( //Repeat new Password Text Field
                childWidget:CustomTextFormField(
                  controller: _repeatNewPasswordController,
                  hintText: CustomTextFormField.repeatNewPasswordText,
                ),
            ),
                CustomFormPadding( // Save Button
                  childWidget: CustomElevatedButton(
                    text: CustomElevatedButton.saveButtonText,
                    onPressed: (){
                     //TODO: implement me...
                  },
                  ),
                ),
              ],
            ),
           ),
          ),
      ),
    );
  }
}





//  FIXME Just for testing will be removed afterwards
void main() {
  runApp(const MaterialApp(home: SetNewPassword()));
}
