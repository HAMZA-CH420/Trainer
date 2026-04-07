import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayTrainingWidget extends StatelessWidget {
  const TodayTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: size.height / 8,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text("Today", style: GoogleFonts.poppins(fontSize: 13)),
                Text(
                  "Strength Training",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "10:00AM - 11:00AM",
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ],
            ),
            Container(
              height: size.height / 7,
              width: size.width / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage("assets/images/strength.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
