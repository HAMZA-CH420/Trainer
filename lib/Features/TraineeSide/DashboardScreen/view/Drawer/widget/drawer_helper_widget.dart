import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../UIhelper/colorPalette/color_palette.dart';

class DrawerHelperWidget extends StatelessWidget {
  const DrawerHelperWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                child: Icon(icon),
              ),
              Text(title, style: GoogleFonts.poppins(fontSize: 18)),
            ],
          ),
          Icon(Icons.arrow_forward, color: Palette.primaryColor),
        ],
      ),
    );
  }
}
