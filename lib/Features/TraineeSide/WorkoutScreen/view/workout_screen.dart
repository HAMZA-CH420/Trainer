import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/Features/TraineeSide/WorkoutScreen/widgets/today_workout.dart';
import 'package:trainer/Features/TraineeSide/WorkoutScreen/widgets/workout_plans.dart';

import '../../DashboardScreen/view/Drawer/view/drawer_widget.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: DashTitle(title: "Workouts"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              TodayWorkout(
                title: "Today's Workout",
                workoutName: "Full body Strength",
                workoutDetails:
                    "Focus on compound movements to build overall strength and endurance.",
                totalExercises: "5 exercises",
                totalTime: "45 min",
              ),
              Text(
                "Workout Plans",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Column(
                spacing: 25,
                children: [
                  WorkoutPlans(
                    onTap: () {},
                    workoutName: "Beginner's Strength",
                    workoutDuration: "4 weeks",
                    image: "workout_image_beginner.png",
                  ),
                  WorkoutPlans(
                    onTap: () {},
                    workoutName: "Cardio Blast",
                    workoutDuration: "2 weeks",
                    image: "workout_image_cardio.png",
                  ),
                  WorkoutPlans(
                    onTap: () {},
                    workoutName: "Flexibility & mobility",
                    workoutDuration: "1 weeks",
                    image: "workout_image_flexibility.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
