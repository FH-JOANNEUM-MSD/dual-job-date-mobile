import 'package:dual_job_date_mobile/tabs/appointments.dart';
import 'package:dual_job_date_mobile/tabs/companies.dart';
import 'package:dual_job_date_mobile/tabs/profile.dart';
import 'package:dual_job_date_mobile/tabs/more.dart';
import 'package:dual_job_date_mobile/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentIndex;
  List<Widget> tabs = [
    const Companies(),
    const Appointments(),
    const Profile(),
    const More()
  ];

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: IndexedStack(
              index: currentIndex,
              children: tabs,
            ),
            bottomNavigationBar: CustomNavigationBar(
              currentIndex: currentIndex,
              onTabTapped: (x) {
                setState(() {
                  currentIndex = x;
                });
              },
            )));
  }
}
