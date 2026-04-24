import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayWorkout extends StatelessWidget {
  const TodayWorkout({
    super.key,
    required this.title,
    required this.workoutName,
    required this.workoutDetails,
    required this.totalTime,
    required this.totalExercises,
  });

  final String title;
  final String workoutName, workoutDetails, totalTime, totalExercises;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Image.asset("assets/images/workout_image.png"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              workoutName,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(workoutDetails, style: GoogleFonts.poppins(fontSize: 15)),
            Row(
              spacing: 8,
              children: [
                Text(totalTime, style: GoogleFonts.poppins(fontSize: 15)),
                Text(".", style: GoogleFonts.poppins(fontSize: 15)),

                Text(totalExercises, style: GoogleFonts.poppins(fontSize: 15)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
