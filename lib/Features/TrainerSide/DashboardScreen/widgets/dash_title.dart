import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashTitle extends StatelessWidget {
  const DashTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
