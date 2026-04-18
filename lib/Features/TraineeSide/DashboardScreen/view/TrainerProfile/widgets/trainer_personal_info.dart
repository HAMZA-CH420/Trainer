import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class TrainerPersonalInfo extends StatefulWidget {
  const TrainerPersonalInfo({
    super.key,
    required this.name,
    required this.specialization,
    required this.experience,
  });

  final String name, specialization, experience;

  @override
  State<TrainerPersonalInfo> createState() => _TrainerPersonalInfoState();
}

class _TrainerPersonalInfoState extends State<TrainerPersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 5,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Palette.primaryColor,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
          Text(
            widget.name,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.specialization,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "${widget.experience} years experience",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
