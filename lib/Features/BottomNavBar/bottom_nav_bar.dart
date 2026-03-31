import 'package:flutter/material.dart';
import 'package:trainer/Features/DashboardScreen/view/dashboard_screen.dart';
import 'package:trainer/Features/ScheduleScreen/view/schedule_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int primaryIndex = 0;
    final List<Widget> screens = [DashboardScreen(), ScheduleScreen()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: primaryIndex,
        items: [],
      ),
      body: IndexedStack(index: primaryIndex, children: screens),
    );
  }
}
