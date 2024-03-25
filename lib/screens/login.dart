import 'package:dual_job_date_mobile/screens/forgot_password.dart';
import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/screens/set_new_password.dart';
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
  late GlobalKey<FormState> _formKey;
  ///Destructor
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  ///Actually build the widget
  @override
  Widget build(BuildContext context) {
    Values.setScreenWidth(MediaQuery.of(context).size.height); //Please comment if necessary
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
        child: SafeArea(
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
                  StaticStrings.login,
                  style: TextStyle(
                    fontSize: Values.screenTitleTextSize,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
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
                          topHeaderDistance: Values.paddingInsetButtonTop,
                          childWidget: CustomElevatedButton(
                            text: StaticStrings.loginButtonText,
                            onPressed: () {
                              // TODO right validation
                              if (_formKey.currentState!.validate()) {
                                login(context);
                              }
                            },
                          ),
                        ),
                        CustomFormPadding(
                            childWidget: TextButton(
                          child: Text(
                            StaticStrings.forgotPassword,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          onPressed: () {
                            navigateToForgotPassword(context);
                          },
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToForgotPassword(BuildContext context) {
              Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                const ForgotPassword()));
  }

  void login(BuildContext context) {
    // TODO check if first login
    if (0 == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const SetNewPassword()));
    }
    // if not first login
    else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => const Home()));
    }
  }
}

