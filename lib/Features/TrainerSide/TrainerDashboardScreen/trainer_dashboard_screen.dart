import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';
import '../../../UiHelper/utilities/widgets/toast_message.dart';
import '../../OnboardingScreens/introProvider/intro_screen.dart';

class TrainerDashboardScreen extends StatelessWidget {
  const TrainerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("D A S H B O A R D"), centerTitle: true),
      body: Center(
        child: IconButton(
          onPressed: () async {
            final SharedPreferences pref =
                await SharedPreferences.getInstance();
            pref.setBool("userLogged", false);
            ToastMessage.showToast(message: "Logged out ", isError: true);
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
