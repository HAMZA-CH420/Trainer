import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/common_goals_widget.dart';
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';

class GoalDescriptionScreen extends StatefulWidget {
  const GoalDescriptionScreen({super.key});

  @override
  State<GoalDescriptionScreen> createState() => _GoalDescriptionScreenState();
}

class _GoalDescriptionScreenState extends State<GoalDescriptionScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor, size: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 10,
                children: [
                  Text(
                    "What are your fitness goals?",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Choose from common goals or create your own.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              CommonGoalsWidget(),
              Text(
                "Custom Goals",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your goal",
                ),
                controller: controller,
              ),
              SizedBox(height: size.height / 5.5),
              CustomPrimaryButton(btnName: "Next", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
