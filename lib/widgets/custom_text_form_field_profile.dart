import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart'; // Assuming path to Values class

/// Class Representing a TextFormField as used in the App with all customizations according to UI/UX in place
class CustomTextFormFieldProfile extends StatefulWidget {
  // Hint Text constants

  // Customizable members
  final TextEditingController controller;
  final String hintText;
  final Color fillColor;
  final Color textColor;
  final int? maxLength;
  final int? maxLines;

  const CustomTextFormFieldProfile({
    super.key,
    required this.controller,
    required this.hintText,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.maxLength,
    this.maxLines,
  });

  @override
  State<CustomTextFormFieldProfile> createState() =>
      _CustomTextFormFieldProfileState();
}

class _CustomTextFormFieldProfileState
    extends State<CustomTextFormFieldProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        16,
        5,
        16,
        5,
      ),
      child: TextFormField(
        textAlign: TextAlign.left,
        controller: widget.controller,
        style: TextStyle(fontSize: 18.0, color: widget.textColor),
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: widget.fillColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Values.roundBorderlineRadius),
            borderSide: BorderSide.none,
          ),
        ),
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
      ),
    );
  }
}
