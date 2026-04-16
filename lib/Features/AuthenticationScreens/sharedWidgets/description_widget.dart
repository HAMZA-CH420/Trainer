import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.validator,
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<DescriptionWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<DescriptionWidget> {
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
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(color: Color(0xFFEBEDEF)),
          child: TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            maxLines: 8,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 13, color: Colors.black45),
            ),
          ),
        ),
      ],
    );
  }
}
