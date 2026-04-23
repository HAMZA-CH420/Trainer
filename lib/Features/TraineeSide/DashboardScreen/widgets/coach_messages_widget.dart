import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

import '../view/MessagesScreen/view/message_screen.dart';

class CoachMessagesWidget extends StatelessWidget {
  const CoachMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageScreen()),
        );
      },
      child: SizedBox(
        child: Row(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Palette.primaryColor,
              child: Icon(Icons.person, color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coach Alex",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: size.width / 1.4,
                  child: Text(
                    "Hey there! Just wanted to check in and see how you're feeling after yesterday's workout. Let me know if you have any questions or need any adjustments for today's session.",
                    style: GoogleFonts.poppins(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
