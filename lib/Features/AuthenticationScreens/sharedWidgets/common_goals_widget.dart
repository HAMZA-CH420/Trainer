import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';

class CommonGoalsWidget extends StatefulWidget {
  final Function(List<String>) onGoalsSelected;
  const CommonGoalsWidget({super.key, required this.onGoalsSelected});

  @override
  State<CommonGoalsWidget> createState() => _CommonGoalsWidgetState();
}

class _CommonGoalsWidgetState extends State<CommonGoalsWidget> {
  final List<String> goals = [
    "Weight Loss",
    "Muscle Gain",
    "Endurance",
    "Running",
    "Flexibility",
    "Swimming",
  ];

  final Set<String> selectedGoals = {};

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
            final goal = goals[index];
            bool isSelected = selectedGoals.contains(goal);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedGoals.remove(goal);
                  } else {
                    selectedGoals.add(goal);
                  }
                });
                widget.onGoalsSelected(selectedGoals.toList());
              },
              child: Container(
                height: size.height / 14,
                width: size.width / 2.5,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected ? Palette.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Palette.primaryColor, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  goal,
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
