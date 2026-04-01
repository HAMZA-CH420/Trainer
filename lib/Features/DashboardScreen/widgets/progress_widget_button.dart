import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class ProgressWidgetButton extends StatelessWidget {
  const ProgressWidgetButton({
    super.key,
    required this.btnName,
    required this.onTap,
  });

  final String btnName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width / 2.6,
        height: size.height / 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
          color: Palette.primaryColor,
        ),
        child: Text(
          btnName,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
