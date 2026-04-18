import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class TrainerAbout extends StatefulWidget {
  const TrainerAbout({
    super.key,
    required this.name,
    required this.specialization,
    required this.experience,
  });

  final String name, specialization, experience;

  @override
  State<TrainerAbout> createState() => _TrainerAboutState();
}

class _TrainerAboutState extends State<TrainerAbout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Palette.primaryColor,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
          Text(
            widget.name,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.specialization,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.experience,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
