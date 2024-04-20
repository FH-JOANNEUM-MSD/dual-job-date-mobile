import 'package:dual_job_date_mobile/components/customSnackbar.dart';
import 'package:dual_job_date_mobile/screens/forgot_password.dart';
import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_bloc.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_event.dart';
import 'package:dual_job_date_mobile/screens/login/authentication_state.dart';
import 'package:dual_job_date_mobile/screens/set_new_password.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/paths.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/widgets/custom_elevated_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_form_padding.dart';
import 'package:dual_job_date_mobile/widgets/custom_loading_indicator.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../static_helpers/values.dart';

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
    Values.setScreenWidth(
        MediaQuery.of(context).size.height); //Please comment if necessary
    return Scaffold(
        body: BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.FIRSTLOGIN:
              navigateToSetNewPassword(context);
              clearControllers();
              break;
            case AuthenticationStatus.AUTHENTICATED:
              navigateToHome(context);
              clearControllers();
              break;
            case AuthenticationStatus.UNAUTHENTICATED:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(StaticStrings.passwordWrong)),
              );
              break;
            default:
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(StaticStrings.somethingWentWrong)),
              );
              break;
          }
        },
        child: Container(
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
                  child: Form(
                    key: _formKey,
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
                        BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                          return CustomFormPadding(
                            topHeaderDistance: Values.paddingInsetButtonTop,
                            childWidget: state.status ==
                                    AuthenticationStatus.PENDING
                                ? const CustomLoadingIndicator()
                                : CustomElevatedButton(
                                    text: StaticStrings.loginButtonText,
                                    onPressed: () {
                                      // TODO right validation
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(LoginEvent(
                                                _emailController.text,
                                                _passwordController.text));
                                      }
                                    },
                                  ),
                          );
                        }),
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
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void navigateToForgotPassword(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPassword()));
  }

  void navigateToSetNewPassword(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const SetNewPassword()));
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => const Home()));
  }

  void clearControllers() {
    _emailController.clear();
    _passwordController.clear();
  }
}
