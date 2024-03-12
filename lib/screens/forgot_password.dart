import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/strings.dart';
import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                  StaticStrings.logo,
                  height:
                      screenWidth * 0.25, //TODO: Make a getter for this value
                ),
              ),
              const CustomFormPadding(
                topHeaderDistance: Values.paddingTitleTop_40,
                childWidget: Text(
                  StaticStrings.resetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Values.screenTitleTextSize_42,
                    fontWeight: FontWeight.bold,
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
