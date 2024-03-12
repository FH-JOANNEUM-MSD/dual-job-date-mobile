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

    final screenWidth = MediaQuery.of(context).size.width;

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
                CustomFormPadding(
                  topHeaderDistance: Values.paddingLogoTop_100,
                  childWidget: Image.asset( //Logo Image
                  StaticStrings.logo,
                  height: screenWidth * 0.25, //TODO: Make a getter for this value
                  ),
                ),
                const CustomFormPadding(
                  topHeaderDistance: Values.paddingTitleTop_40,
                  childWidget: Text( //Title of the screen
                  StaticStrings.changePassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Values.screenTitleTextSize_42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                //Form consisting of 3 Text inputs and one button
                CustomFormPadding( //Current Password Text Field
                    childWidget: CustomTextFormField(
                      controller: _currentPasswordController,
                      hintText: CustomTextFormField.currentPasswordText,
                      isHidden: true,
                    ),
                ),
            CustomFormPadding( //New Password Text Field
                childWidget: CustomTextFormField(
                  controller: _newPasswordController,
                  hintText: CustomTextFormField.newPasswordText,
                  isHidden: true,
                ),
            ),
            CustomFormPadding( //Repeat new Password Text Field
                childWidget:CustomTextFormField(
                  controller: _repeatNewPasswordController,
                  hintText: CustomTextFormField.repeatNewPasswordText,
                  isHidden: true,
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
