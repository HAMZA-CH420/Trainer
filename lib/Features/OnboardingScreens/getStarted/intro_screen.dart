import 'package:flutter/material.dart';

import '../../../UiHelper/utilities/widgets/custom_primary_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              "Your fitness journey starts here",

              textAlign: TextAlign.center,
            ),
            Text(
              "Get personalized training plans, track your progress, and achieve your fitness goals with our app.",
              textAlign: TextAlign.center,
            ),
            CustomPrimaryButton(btnName: "Sign In", onTap: () {}),
            CustomPrimaryButton(
              btnName: "Create new account",
              secondary: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
