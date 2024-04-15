import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';
import 'package:dual_job_date_mobile/static_helpers/values.dart';

/// Class Representing a TextFormField as used in Update Profile Screen with all customizations according to UI/UX in place
class CustomTextFormFieldProfile extends StatefulWidget {
  final String hintText;
  final Color fillColor;
  final Color textColor;
  final int? maxLength;
  final int? maxLines;
  final String? initialValue;

  const CustomTextFormFieldProfile({
    super.key,
    required this.hintText,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.maxLength,
    this.maxLines,
    this.initialValue = '',
  });

  @override
  State<CustomTextFormFieldProfile> createState() =>
      _CustomTextFormFieldProfileState();
}

class _CustomTextFormFieldProfileState
    extends State<CustomTextFormFieldProfile> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: Values.paddingHorizontalProfileScreen,
      vertical: 5.0,
    );
    return Padding(
      padding: padding,
      child: TextFormField(
        initialValue: widget.initialValue,
        style: TextStyle(fontSize: Values.inputTextSize, color: widget.textColor),
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: widget.fillColor,
          contentPadding: padding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Values.roundBorderlineRadius),
            borderSide: BorderSide.none,
          ),
        ),
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
      ),
    );
  }
}
