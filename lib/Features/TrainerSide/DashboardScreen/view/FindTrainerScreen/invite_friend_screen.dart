import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/TrainerSide/DashboardScreen/view/FindTrainerScreen/widgets/invite_link_widget.dart';

import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

import '../../widgets/dash_title.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
        ),
        title: DashTitle(title: "Invite People"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              "Share the Gains, Save on Your Next Course",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              "Share TrainerHQ with a friend. When they join, you both get 15% off your next course or consultation.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            InviteLinkWidget(),
          ],
        ),
      ),
    );
  }
}
