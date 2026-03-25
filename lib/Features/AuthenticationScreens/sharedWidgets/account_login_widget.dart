import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountLoginWidget extends StatelessWidget {
  const AccountLoginWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        spacing: 18,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height / 18,
                width: size.width / 2.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SvgPicture.asset("assets/logo/google.svg"),
                    Text("Google"),
                  ],
                ),
              ),
              Container(
                height: size.height / 18,
                width: size.width / 2.4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    SvgPicture.asset("assets/logo/apple.svg"),
                    Text("Apple"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
