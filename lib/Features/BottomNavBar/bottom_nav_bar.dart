import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trainer/Features/DashboardScreen/view/dashboard_screen.dart';
import 'package:trainer/Features/NutritionScreen/view/nutrition_screen.dart';
import 'package:trainer/Features/ProfileScreen/view/profile_screen.dart';
import 'package:trainer/Features/ScheduleScreen/view/schedule_screen.dart';
import 'package:trainer/Features/WorkoutScreen/view/workout_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int primaryIndex = 0;
    final List<Widget> screens = [
      DashboardScreen(),
      ScheduleScreen(),
      WorkoutScreen(),
      NutritionScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: primaryIndex,
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
            label: "Dashboard",
          ),
        ],
      ),
      body: IndexedStack(index: primaryIndex, children: screens),
    );
  }
}
