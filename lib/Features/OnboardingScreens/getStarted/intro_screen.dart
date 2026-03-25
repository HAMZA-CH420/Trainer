import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/OnboardingScreens/getStarted/widgets/alert_box_widget.dart';

import '../../../UiHelper/utilities/widgets/custom_primary_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        spacing: 25,
        children: [
          Container(
            height: size.height / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/intro_image.jpg"),
              ),
            ),
          ),
          Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your fitness journey starts here",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: size.width / 1.2,
                child: Text(
                  "Get personalized training plans, track your progress, and achieve your fitness goals with our app.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height / 18),
          Column(
            spacing: 20,
            children: [
              CustomPrimaryButton(btnName: "Sign In", onTap: () {}),
              CustomPrimaryButton(
                btnName: "Create new account",
                secondary: true,
                onTap: () {
                  dialogueBox(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future dialogueBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: AlertBoxWidget());
      },
    );
  }
}
