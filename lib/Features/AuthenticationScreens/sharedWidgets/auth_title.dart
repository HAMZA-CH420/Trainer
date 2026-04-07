import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trainer/UiHelper/colorPalette/color_palette.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.postSubtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String postSubtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        Row(
          children: [
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                postSubtitle,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Palette.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
