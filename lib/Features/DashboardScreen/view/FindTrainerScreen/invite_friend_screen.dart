import 'package:flutter/material.dart';
import 'package:trainer/Features/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
        ),
        title: DashTitle(title: "Invite People"),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
