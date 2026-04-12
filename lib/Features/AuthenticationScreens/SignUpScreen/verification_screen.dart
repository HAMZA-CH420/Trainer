import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:trainer/Features/AuthenticationScreens/SignUpScreen/goal_description_screen.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({
    super.key,
    required this.userId,
    required this.phone,
  });

  final String userId;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor, size: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 35,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Verify your phone number",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "We sent you a code to verify your phone number",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "Sent to $phone",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Pinput(
              defaultPinTheme: PinTheme(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: TextStyle(color: Palette.primaryColor, fontSize: 25),
              ),
              focusedPinTheme: PinTheme(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.primaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                textStyle: TextStyle(color: Palette.primaryColor, fontSize: 25),
              ),
            ),
            Column(
              children: [
                Text("didn't receive the code?"),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            CustomPrimaryButton(
              btnName: "Verify",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoalDescriptionScreen(userId: userId),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
