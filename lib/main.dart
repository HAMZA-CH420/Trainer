import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/SignUpScreen/goal_description_screen.dart';
import 'package:trainer/Features/OnboardingScreens/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: GoalDescriptionScreen(),
    );
  }
}
