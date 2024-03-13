import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

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
    Values.setScreenWidth(
        screenWidth); //FIXME: Remove this once the custom starting class for this screen gets removed

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              topHeaderDistance: Values.paddingLogoTop,
              childWidget: Image.asset(
                Paths.logo,
                height: Values.getScaledLogoSize(),
              ),
            ),
            const CustomFormPadding(
              topHeaderDistance: Values.paddingTitleTop,
              childWidget: Text(
                StaticStrings.resetPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Values.screenTitleTextSize,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomFormPadding(
                    childWidget: CustomTextFormField(
                      controller: _emailController,
                      hintText: StaticStrings.emailText,
                      isHidden: false,
                    ),
                  ),
                  CustomFormPadding(
                    childWidget: CustomElevatedButton(
                      text: StaticStrings.sendButtonText,
                      onPressed: () {
                        //TODO: implement me....
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

// FIXME: Just for testing will be removed afterwards
void main() {
  runApp(const MaterialApp(home: ForgotPassword()));
}