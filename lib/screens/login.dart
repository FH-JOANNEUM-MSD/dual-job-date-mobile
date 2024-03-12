import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../static_helpers/values.dart';
import '../widgets/custom_elevated_button.dart';

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
    // Get screen size

    return Scaffold(
      // Set the primary background color
      body: Stack(
        children: [
          // color gradient for background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  StaticColors.topBackgroundScreen,
                  StaticColors.bottomBackgroundScreen,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Center(
            child: Column(
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
                    StaticStrings.login,
                    style: TextStyle(
                      fontFamily: 'Parka', // FIXME: need approved google font
                      fontSize: Values
                          .screenTitleTextSize_42, // Adjust the font size as needed
                    ),
                  ),
                ),
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
                CustomFormPadding(
                  topHeaderDistance: Values.paddingEdgeInsetBottom_0,
                  childWidget: TextButton(
                    onPressed: () {
                      // Action for forgotten password
                    },
                    child: Text(StaticStrings.forgotPassword,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: Values.linkTextSize_20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
