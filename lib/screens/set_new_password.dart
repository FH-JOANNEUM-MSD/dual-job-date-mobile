import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:dual_job_date_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatNewPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(241, 254, 227, 1), //FIXME: Is this the right color? If so -> move to constant
                  Color.fromRGBO(209, 231, 187, 1),
                ],
              ),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                StaticStrings.logo,
                height: Values.logoImageWidthHeight_200,
                width: Values.logoImageWidthHeight_200,
              ),
              const Text(
                StaticStrings.changePassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Values.headerTextSize_24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Values.paddingEdgeInset_8),
                child: CustomTextFormField(controller:  _currentPasswordController,
                hintText: CustomTextFormField.currentPasswordText,),
              ),
              Padding(
                padding: const EdgeInsets.all(Values.paddingEdgeInset_8),
                child: CustomTextFormField(controller: _newPasswordController,
                  hintText: CustomTextFormField.newPasswordText),
              ),
              Padding(
                padding: const EdgeInsets.all(Values.paddingEdgeInset_8),
                child:  CustomTextFormField(controller: _repeatNewPasswordController,
                  hintText: CustomTextFormField.repeatNewPasswordText),
              ),
              Padding(
                padding: const EdgeInsets.all(Values.paddingEdgeInset_8),
                child: CustomElevatedButton(text: CustomElevatedButton.saveButtonText,
                onPressed: (){
                  //TODO: implement me...
                },),
              ),
            ],
          ),
                    ),
      ),
    );
  }
}



//  FIXME Just for testing will be removed afterwards
void main() {
  runApp(const MaterialApp(home: SetNewPassword()));
}
