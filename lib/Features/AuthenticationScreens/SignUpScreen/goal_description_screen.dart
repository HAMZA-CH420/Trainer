import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/common_goals_widget.dart';
import 'package:trainer/Features/TraineeSide/BottomNavBar/bottom_nav_bar.dart'
    show BottomNavBar;
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';
import 'package:trainer/UiHelper/utilities/widgets/toast_message.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';

class GoalDescriptionScreen extends StatefulWidget {
  final String userId;

  const GoalDescriptionScreen({super.key, required this.userId});

  @override
  State<GoalDescriptionScreen> createState() => _GoalDescriptionScreenState();
}

class _GoalDescriptionScreenState extends State<GoalDescriptionScreen> {
  final controller = TextEditingController();
  List<String> selectedGoals = [];

  @override
  Widget build(BuildContext context) {
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
              CommonGoalsWidget(
                onGoalsSelected: (goals) {
                  selectedGoals = goals;
                },
              ),
              Text(
                "Custom Goals",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your goal",
                ),
                controller: controller,
              ),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                btnName: "Finish",
                onTap: () {
                  List<String> finalGoals = List.from(selectedGoals);
                  if (controller.text.trim().isNotEmpty) {
                    finalGoals.add(controller.text.trim());
                  }

                  if (finalGoals.isNotEmpty) {
                    context.read<DbProvider>().updateGoals(
                      userId: widget.userId,
                      goals: finalGoals,
                    );
                    var pref = SharedPreferences.getInstance();
                    pref.then((value) {
                      value.setBool("userLogged", true);
                    });

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavBar(),
                      ),
                      (route) => false,
                    );
                    ToastMessage.showToast(
                      message: "Account creation successful.",
                      isError: false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
