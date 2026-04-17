import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/UiHelper/colorPalette/color_palette.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hint,
    this.isPass = false,
    required this.controller,
    this.validator,
  });

  final String title;
  final String hint;
  final bool isPass;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Container(
          height: 55,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFEBEDEF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.isPass ? showPass : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
              suffixIcon: widget.isPass
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                        showPass
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: Palette.primaryColor,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
