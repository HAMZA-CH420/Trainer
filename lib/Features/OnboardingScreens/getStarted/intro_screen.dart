import 'package:flutter/material.dart';

import '../../../UiHelper/utilities/widgets/custom_primary_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10,
        children: [
          Text("Your fitness journey starts here", textAlign: TextAlign.center),
          Text(
            "Get personalized training plans, track your progress, and achieve your fitness goals with our app.",
            textAlign: TextAlign.center,
          ),
          CustomPrimaryButton(btnName: "Sign In"),
          CustomPrimaryButton(btnName: "Create new account", secondary: true),
        ],
      ),
    );
  }
}
