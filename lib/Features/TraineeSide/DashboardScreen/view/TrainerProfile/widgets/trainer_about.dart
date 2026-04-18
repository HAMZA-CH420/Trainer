import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerAbout extends StatelessWidget {
  const TrainerAbout({super.key, required this.about});

  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          "About Me",
          style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(about, style: GoogleFonts.poppins(fontSize: 16)),
      ],
    );
  }
}
