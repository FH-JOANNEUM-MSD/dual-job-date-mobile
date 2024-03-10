import 'package:flutter/material.dart';

/// Class Representing a TextFormField as used in the App with all customizations according to UI/UX in place
class CustomTextFormField {
  late TextFormField field ; // The field that gets returned for use

  //Hint Text constants
  static const  String newPasswordText = 'Neues Passwort';
  static const  String repeatNewPasswordText = 'Passwort Wiederholen';
  static const  String currentPasswordText = 'Aktuelles Passwort';

  /// Constructor for the Text form field
  /// controller: A TextEditingController for the CustomTextFormField
  /// hintText:  A String used as a hintText in the CustomTextFormFields
  /// use the constants as a hint text for best practise.
  CustomTextFormField(TextEditingController controller, String hintText){
    //Create the field

    field = TextFormField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
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
      obscureText: true,
    );
  }

  /// get the custom widget back (type: TextFormField). Can be used directly.
  TextFormField getWidget() => field;

}