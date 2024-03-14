import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(Values.screenWidth * 0.06, 0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }
}
