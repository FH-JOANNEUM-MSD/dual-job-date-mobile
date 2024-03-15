import 'package:dual_job_date_mobile/static_helpers/values.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;

  const CustomDivider({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: 2,
      indent: Values.paddingVerticalProfileScreen,
      endIndent: Values.paddingVerticalProfileScreen,
    );
  }
}
