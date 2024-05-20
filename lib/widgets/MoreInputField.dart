import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

class MoreInputField extends StatelessWidget {
  const MoreInputField(
      {super.key, required this.controller, required this.placeHolder});

  final TextEditingController controller;
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: TextField(
        autofocus: true,
        controller: controller, // Use the corrected name
        decoration: InputDecoration(
          hintText: placeHolder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: StaticColors.buttonColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
    );
  }
}
