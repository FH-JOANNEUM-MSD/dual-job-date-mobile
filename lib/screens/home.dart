import 'package:dual_job_date_mobile/tabs/appointments.dart';
import 'package:dual_job_date_mobile/tabs/companies.dart';
import 'package:dual_job_date_mobile/tabs/profile.dart';
import 'package:dual_job_date_mobile/tabs/view_likes_and_matches.dart';
import 'package:dual_job_date_mobile/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentIndex;
  List<StatefulWidget> tabs = [
    const Companies(),
    const LikesAndMatches(),
    const Appointments(),
    const Profile()
  ];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: tabs[currentIndex],
            bottomNavigationBar: BottomNavBar(
              currentIndex: currentIndex,
              onTabTapped: (x) {
                setState(() {
                  currentIndex = x;
                });
              },
    )));
  }
}
