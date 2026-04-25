import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/UiHelper/utilities/widgets/toast_message.dart';

import '../../../Features/OnboardingScreens/introProvider/intro_screen.dart';
import '../../../Features/TraineeSide/DashboardScreen/view/Drawer/widget/drawer_helper_widget.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHelperWidget(
      onTap: () {
        dialogBox(context);
      },
      title: "Logout",
      icon: Icons.logout,
    );
  }

  Future<void> dialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Are you sure you want to log out?"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("no"),
            ),
            InkWell(
              onTap: () async {
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
              child: Text("yes"),
            ),
          ],
        );
      },
    );
  }
}
