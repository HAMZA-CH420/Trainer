import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/auth_title.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Palette.primaryColor, size: 30),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitle(
                title: "Login to your account!",
                subtitle: "Don't have an account? ",
                postSubtitle: "Sign up",
                onTap: () {},
              ),
              CustomTextField(title: "E-mail", hint: "abc@gmail.com"),
            ],
          ),
        ),
      ),
    );
  }
}
