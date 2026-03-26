import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/AuthenticationScreens/SignUpScreen/sign_up_screen.dart';
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
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: List.generate(content.length, (index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Container(
                height: size.height / 12,
                margin: EdgeInsets.symmetric(vertical: 5),
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
