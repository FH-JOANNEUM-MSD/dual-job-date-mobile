import 'package:flutter/material.dart';

/// Class Representing a TextFormField as used in the App with all customizations according to UI/UX in place
class CustomTextFormField extends StatelessWidget {

  //Hint Text constants
  static const  String newPasswordText = 'Neues Passwort';
  static const  String repeatNewPasswordText = 'Passwort Wiederholen';
  static const  String currentPasswordText = 'Aktuelles Passwort';

  //Customizable modifiers
  final TextEditingController controller;
  final String hintText;

  /// Constructor for the Text form field
  /// controller: A TextEditingController for the CustomTextFormField
  /// hintText:  A String used as a hintText in the CustomTextFormFields
  /// use the constants as a hint text for best practise.
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
  }
  );

  ///Build the Widget
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: controller, // this comes from the constructor
      decoration: InputDecoration(
        hintText: hintText, //this comes from the constructor
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: true, //Make the characters in the TextField appear as Dots
    );
  }
}