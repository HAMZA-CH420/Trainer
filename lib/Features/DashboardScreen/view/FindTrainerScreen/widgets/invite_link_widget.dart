import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class InviteLinkWidget extends StatelessWidget {
  InviteLinkWidget({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * .055,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        maxLines: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "invite link",
          suffixIcon: Container(
            width: size.width * .3,
            decoration: BoxDecoration(
              color: Palette.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.link, color: Colors.white),
                Text(
                  "Invite Link",
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
