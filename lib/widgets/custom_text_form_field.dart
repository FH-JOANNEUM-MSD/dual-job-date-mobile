import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/material.dart';

/// Class Representing a TextFormField as used in the App with all customizations according to UI/UX in place
class CustomTextFormField extends StatelessWidget {

  //Hint Text constants



  //Customizable members
  final TextEditingController _controller;
  final String _hintText;
  final bool _hidden;

  /// Constructor for the Text form field
  /// * [_controller]: A TextEditingController for the CustomTextFormField
  /// * [_hintText]:  A String used as a hintText in the CustomTextFormFields
  /// * use the constants as a hint text for best practise.
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required String hintText,
    required bool isHidden,
  }
  ) : _hintText = hintText, _controller = controller, _hidden = isHidden;

  ///Build the Widget
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      controller: _controller, // this comes from the constructor
      style: const TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        hintText: _hintText, //this comes from the constructor
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Values.roundBorderlineRadius), // Rounded corners
          borderSide: BorderSide.none, // Remove border
        ),
      ),
      obscureText: _hidden, //Make the characters in the TextField appear as Dots
    );
  }
}