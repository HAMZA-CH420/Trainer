import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPlans extends StatelessWidget {
  const WorkoutPlans({
    super.key,
    required this.workoutName,
    required this.workoutDuration,
    required this.image,
  });

  final String workoutName, workoutDuration, image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workoutName,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(workoutDuration, style: GoogleFonts.poppins(fontSize: 15)),
            ],
          ),
          SizedBox(width: 150, child: Image.asset("assets/images/$image")),
        ],
      ),
    );
  }
}
