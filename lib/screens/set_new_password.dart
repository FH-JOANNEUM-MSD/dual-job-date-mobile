import 'package:dual_job_date_mobile/custom_widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';

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
                  Color.fromRGBO(241, 254, 227, 1),
                  Color.fromRGBO(209, 231, 187, 1),
                ],
              ),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 200.0,
                width: 200.0,
              ),
              const Text(
                'Passwort ändern',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(_currentPasswordController,CustomTextFormField.currentPasswordText).getWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(_newPasswordController,CustomTextFormField.newPasswordText).getWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(_repeatNewPasswordController,CustomTextFormField.repeatNewPasswordText).getWidget(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(color: Colors.white),
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  child: const Text(
                    'SPEICHERN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
                    ),
      ),
    );
  }
}

// Just for testing will be removed afterwards
void main() {
  runApp(const MaterialApp(home: SetNewPassword()));
}
