import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/strings.dart';
import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';

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
      return Scaffold(
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  StaticStrings.logo,
                  height: Values.logoImageWidthHeight_200,
                  width: Values.logoImageWidthHeight_200,
                ),
                const Text(
                  StaticStrings.resetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Values.headerTextSize_24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                CustomFormPadding(
                  childWidget: CustomTextFormField(controller:  _emailController,
                  hintText: CustomTextFormField.emailText),
                ),
                CustomFormPadding(
                  childWidget: CustomElevatedButton(
                    text: CustomElevatedButton.sendButtonText,
                    onPressed: (){
                    //TODO: implement me....
                  },
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
  runApp(MaterialApp(home: ForgotPassword()));
}
