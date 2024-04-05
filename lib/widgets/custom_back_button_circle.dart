import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../static_helpers/colors.dart';
import '../static_helpers/paths.dart';
import '../static_helpers/strings.dart';
import '../static_helpers/values.dart';

class CustomBackButtonCircle extends StatelessWidget {
  const CustomBackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: Values.paddingHorizontalScreen,
      child: Container(
        decoration: BoxDecoration(
          color: StaticColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.of(context).pop(),
          child: SvgPicture.asset(
            Paths.arrowLeft,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
