import 'package:dual_job_date_mobile/static_helpers/colors.dart';
import 'package:dual_job_date_mobile/static_helpers/strings.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTabTapped});

  final int currentIndex;
  final Function(int) onTabTapped;

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
        buildNavBarItem(StaticStrings.group),
        buildNavBarItem(StaticStrings.flame),
        buildNavBarItem(StaticStrings.calendar),
        buildNavBarItem(StaticStrings.profile),
      ],
    );
  }

  BottomNavigationBarItem buildNavBarItem(String asset) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          width: 40,
          height: 40,
          asset,
          color: StaticColors.primary,
        ),
        activeIcon: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              width: 40,
              height: 40,
              asset,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: StaticColors.shadow,
        label: "");
  }
}
