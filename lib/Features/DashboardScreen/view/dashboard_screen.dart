import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/DashboardScreen/widgets/coach_messages_widget.dart';
import 'package:trainer/Features/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/Features/DashboardScreen/widgets/progress_widget.dart';
import 'package:trainer/Features/DashboardScreen/widgets/progress_widget_button.dart';
import 'package:trainer/Features/DashboardScreen/widgets/today_training_widget.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Palette.primaryColor),
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashTitle(title: "Upcoming"),
              TodayTrainingWidget(),
              DashTitle(title: "Progress"),
              ProgressWidget(),
              DashTitle(title: "Messages"),
              CoachMessagesWidget(),
              Align(
                heightFactor: 3,
                child: ProgressWidgetButton(
                  btnName: "Find a Trainer",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
