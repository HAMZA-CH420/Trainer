import 'package:flutter/material.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
    );
  }
}
