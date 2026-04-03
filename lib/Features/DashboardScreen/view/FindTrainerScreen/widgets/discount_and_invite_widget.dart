import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class DiscountAndInviteWidget extends StatelessWidget {
  const DiscountAndInviteWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * .08,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(color: Palette.primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedDiscount,
                color: Palette.primaryColor,
                size: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invite & Get Discount",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Get People to app and get 10% off",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
