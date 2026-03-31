import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/OnboardingScreens/introProvider/intro_screen.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Center(
        child: IconButton(
          onPressed: () async {
            final SharedPreferences pref =
                await SharedPreferences.getInstance();
            pref.setBool("userLogged", false);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
              (route) => false,
            );
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedLogout01,
            size: 40,
            color: Palette.primaryColor,
          ),
        ),
      ),
    );
  }
}
