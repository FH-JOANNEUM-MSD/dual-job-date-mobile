import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

class MoreElevatedButton extends StatelessWidget {
  const MoreElevatedButton(
      {super.key, required this.onPressed, required this.text});

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed(),
        style:
            ElevatedButton.styleFrom(backgroundColor: StaticColors.buttonColor),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}
