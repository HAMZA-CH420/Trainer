import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

import '../DashboardScreen/view/dashboard_screen.dart';
import '../NutritionScreen/view/nutrition_screen.dart';
import '../ProfileScreen/view/profile_screen.dart';
import '../ScheduleScreen/view/schedule_screen.dart';
import '../WorkoutScreen/view/workout_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int primaryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      DashboardScreen(),
      ScheduleScreen(),
      WorkoutScreen(),
      NutritionScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: primaryIndex,
        onTap: (value) {
          setState(() {
            primaryIndex = value;
          });
        },
        selectedIconTheme: IconThemeData(color: Palette.primaryColor),
        unselectedIconTheme: IconThemeData(color: Colors.black54),
        selectedItemColor: Palette.primaryColor,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 30),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCalendarSetting01),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedBodyPartMuscle),
            label: "Workout",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCarrot),
            label: "Nutrition",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(index: primaryIndex, children: screens),
    );
  }
}
