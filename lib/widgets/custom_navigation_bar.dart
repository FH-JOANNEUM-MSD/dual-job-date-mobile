import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:flutter/material.dart';

import '../static_helpers/paths.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {super.key, required this.currentIndex, required this.onTabTapped});

  final int currentIndex;
  final Function(int) onTabTapped;
  final iconSizeInactive = 40.0;
  final iconSizeActive = 40.0;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      backgroundColor: StaticColors.shadow,
      currentIndex: currentIndex,
      onTap: (index) {
        onTabTapped(index);
      },
      items: [
        buildNavBarItem(Paths.group),
        buildNavBarItem(Paths.calendar),
        buildNavBarItem(Paths.more),
      ],
    );
  }

  BottomNavigationBarItem buildNavBarItem(String asset) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          asset,
          color: StaticColors.primary,
          width: iconSizeInactive,
          height: iconSizeInactive
        ),
        activeIcon: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              asset,
              width: iconSizeActive,
              height: iconSizeActive,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: StaticColors.shadow,
        label: "");
  }
}
