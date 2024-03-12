import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/paths.dart';
import '../static_helpers/strings.dart';
import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';

///Class representing the ForgotPassword Screen
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

/// Class for Widget State
class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  ///Destructor
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  ///Actually build the Screen
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Values.setScreenWidth(screenWidth); //FIXME: Move this to start or splash screen, only needs to be set once!

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
                childWidget: Image.asset(
                  Paths.logo,
                  height: Values.getScaledLogoSize(),
                ),
              ),
              const CustomFormPadding(
                topHeaderDistance: Values.paddingTitleTop_40,
                childWidget: Text(
                  StaticStrings.resetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Values.screenTitleTextSize_42,
                  ),
                ),
              ),
              CustomFormPadding(
                childWidget: CustomTextFormField(
                  controller: _emailController,
                  hintText: CustomTextFormField.emailText,
                  isHidden: true,
                ),
              ),
              CustomFormPadding(
                childWidget: CustomElevatedButton(
                  text: CustomElevatedButton.sendButtonText,
                  onPressed: () {
                    //TODO: implement me....
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// FIXME: Just for testing will be removed afterwards
void main() {
  runApp(MaterialApp(home: ForgotPassword()));
}
