import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int primaryIndex = 0;
    final List<Widget> screens = [];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: primaryIndex,
        items: [],
      ),
      body: IndexedStack(index: primaryIndex, children: screens),
    );
  }
}
