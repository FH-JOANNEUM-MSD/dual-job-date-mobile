import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

class MoreOutlinedButton extends StatelessWidget {
  const MoreOutlinedButton(
      {super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed(),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(color: StaticColors.buttonColor),
        ));
  }
}
