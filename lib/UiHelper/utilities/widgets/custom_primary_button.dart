import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UiHelper/colorPalette/color_palette.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.btnName,
    this.secondary = false,
    required this.onTap,
  });

  final String btnName;
  final bool secondary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height / 17,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(5),
          color: secondary ? Colors.white : Palette.primaryColor,
        ),
        child: Text(
          btnName,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: secondary ? FontWeight.w400 : FontWeight.w600,
            color: secondary ? Palette.primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
