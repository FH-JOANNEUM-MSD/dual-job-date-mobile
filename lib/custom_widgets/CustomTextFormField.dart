import 'package:flutter/material.dart';

class CustomTextFormField {
  late TextFormField field ;
  static const  String newPasswordText = 'Neues Passwort';
  static const  String repeatNewPasswordText = 'Passwort Wiederholen';
  static const  String currentPasswordText = 'Aktuelles Passwort';

  CustomTextFormField(TextEditingController controller, String hintText){
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

  TextFormField getWidget() => field;

}