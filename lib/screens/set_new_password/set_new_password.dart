import 'package:dual_job_date_mobile/screens/home.dart';
import 'package:dual_job_date_mobile/screens/set_new_password/set_new_password_bloc.dart';
import 'package:dual_job_date_mobile/screens/set_new_password/set_new_password_event.dart';
import 'package:dual_job_date_mobile/screens/set_new_password/set_new_password_state.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/validators.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/widgets/custom_back_button.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/customSnackbar.dart';
import '../../static_helpers/paths.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_form_padding.dart';

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

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

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
    Values.setScreenWidth(
        MediaQuery
            .of(context)
            .size
            .height); //Please comment if necessary
    return Scaffold(
      body: BlocProvider(
        create: (context) => SetNewPasswordBloc(),
        child: BlocListener<SetNewPasswordBloc, SetNewPasswordState>(
          listener: (context, state) {
            if (state.status == SetNewPasswordStatus.newPasswordSet) {
              navigateToHome(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Passwort konnte nicht geändert werden.'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height, //Full size the container
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    //Background gradient
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      StaticColors.topBackgroundScreen,
                      StaticColors.bottomBackgroundScreen,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomFormPadding(
                            childWidget: Image.asset(
                              //Logo Image
                              Paths.logo,
                              height: Values.getScaledLogoSize(),
                            ),
                          ),
                          const Text(
                            //Title of the screen
                            StaticStrings.changePassword,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Values.screenTitleTextSize,
                            ),
                          ),
                          //Form consisting of 3 Text inputs and one button
                          CustomFormPadding(
                            //Current Password Text Field
                            childWidget: CustomTextFormField(
                              controller: _currentPasswordController,
                              hintText: StaticStrings.currentPasswordText,
                              isHidden: true,
                              validator: PasswordValidator().validatePassword,
                            ),
                          ),
                          CustomFormPadding(
                            //New Password Text Field
                            childWidget: CustomTextFormField(
                              controller: _newPasswordController,
                              hintText: StaticStrings.newPasswordText,
                              isHidden: true,
                              validator:
                              PasswordValidator().validateNewPassword,
                            ),
                          ),
                          CustomFormPadding(
                            //Repeat new Password Text Field
                            childWidget: CustomTextFormField(
                              controller: _repeatNewPasswordController,
                              hintText: StaticStrings.repeatNewPasswordText,
                              isHidden: true,
                              validator: PasswordValidator().validatePassword,
                            ),
                          ),
                          BlocBuilder<SetNewPasswordBloc, SetNewPasswordState>(
                            builder: (context, state) {
                              return CustomFormPadding(
                                // Save Button
                                  childWidget: CustomElevatedButton(
                                      text: StaticStrings.saveButtonText,
                                      onPressed: () async {
                                        String? isValid = PasswordValidator()
                                            .validateChange(
                                            _currentPasswordController.text,
                                            _newPasswordController.text,
                                            _repeatNewPasswordController
                                                .text);

                                        if (isValid == null) {
                                          BlocProvider.of<SetNewPasswordBloc>(
                                              context)
                                              .add(SetNewPasswordEvent(
                                              _currentPasswordController
                                                  .text,
                                              _newPasswordController.text));
                                        } else {
                                          //TODO: This doesn't look too good, review this.
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                              customSnackBarWidget(isValid)
                                          );
                                        }
                                      }));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const CustomBackButton()
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => const Home()));
  }
}
