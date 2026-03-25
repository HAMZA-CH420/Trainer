import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UiHelper/colorPalette/color_palette.dart';

class AlertBoxWidget extends StatefulWidget {
  const AlertBoxWidget({super.key});

  @override
  State<AlertBoxWidget> createState() => _AlertBoxWidgetState();
}

class _AlertBoxWidgetState extends State<AlertBoxWidget> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> content = ["TRAINER", "TRAINEE"];

    return Wrap(
      children: List.generate(content.length, (index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              print(index);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Palette.primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Palette.primaryColor, width: 1),
            ),
            alignment: Alignment.center,
            child: Text(
              content[index],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Palette.primaryColor,
              ),
            ),
          ),
        );
      }),
    );
  }
}
