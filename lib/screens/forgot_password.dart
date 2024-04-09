import 'package:dual_job_date_mobile/static_helpers/validators.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';

import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_back_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';

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
  late GlobalKey<FormState> _formKey;
  ///Destructor
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  ///Actually build the Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: SafeArea(
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
                        fontFamily: StaticStrings.font,
                        fontSize: Values.screenTitleTextSize,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          CustomFormPadding(
                            childWidget: CustomTextFormField(
                              controller: _emailController,
                              hintText: StaticStrings.emailText,
                              isHidden: false,
                              validator: EmailValidator().validate,
                            ),
                          ),
                          CustomFormPadding(
                            childWidget: CustomElevatedButton(
                              text: StaticStrings.sendButtonText,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  //TODO: Navigation
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomBackButton()
        ],
      ),
    );
  }
}

