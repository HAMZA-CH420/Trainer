import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../UiHelper/colorPalette/color_palette.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
          activeColor: Palette.primaryColor,
          splashRadius: 5,
        ),
        Text(
          "I accept the terms and privacy policy",
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ],
    );
  }
}
