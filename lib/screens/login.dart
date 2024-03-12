import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/custom_elevated_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/values.dart';

/// Screen for login
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

/// State Class: Needed for stateful widget
class _LoginState extends State<Login> {
  /// controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///Destructor
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  ///Actually build the widget
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
              topHeaderDistance: Values.paddingLogoTop_50,
              childWidget: Image.asset(
                //Logo Image
                Paths.logo,
                height: Values.getScaledLogoSize(),
              ),
            ),
            const CustomFormPadding(
              topHeaderDistance: Values.paddingTitleTop_40,
              childWidget: Text(
                StaticStrings.login,
                style: TextStyle(
                  fontSize: Values.screenTitleTextSize_24,
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
                    childWidget: CustomTextFormField(
                      controller: _passwordController,
                      hintText: StaticStrings.requiredPassword,
                      isHidden: true,
                    ),
                  ),
                  CustomFormPadding(
                    topHeaderDistance: Values.paddingInsetButtonTop_20,
                    childWidget: CustomElevatedButton(
                      text: StaticStrings.loginButtonText,
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

void main() {
  runApp(const MaterialApp(home: Login()));
}
