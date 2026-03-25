import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.postSubtitle,
    required this.onTap,
  });

  final String title, subtitle, postSubtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                postSubtitle,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
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
