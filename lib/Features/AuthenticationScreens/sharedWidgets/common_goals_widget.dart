import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';

class CommonGoalsWidget extends StatefulWidget {
  const CommonGoalsWidget({super.key});

  @override
  State<CommonGoalsWidget> createState() => _CommonGoalsWidgetState();
}

class _CommonGoalsWidgetState extends State<CommonGoalsWidget> {
  List<String> goals = [
    "Weight Loss",
    "Muscle Gain",
    "Endurance",
    "Running",
    "Flexibility",
    "Swimming",
  ];

  final Set<int> selectedIndex = {};

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Common Goals",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 20,
          children: List.generate(goals.length, (index) {
            bool isSelected = selectedIndex.contains(index);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selectedIndex.contains(index)) {
                    selectedIndex.remove(index);
                  } else {
                    selectedIndex.add(index);
                  }
                });
              },
              child: Container(
                height: size.height / 14,
                width: size.width / 2.5,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected ? Palette.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Palette.primaryColor, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  goals[index],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: isSelected ? Colors.white : Palette.primaryColor,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
