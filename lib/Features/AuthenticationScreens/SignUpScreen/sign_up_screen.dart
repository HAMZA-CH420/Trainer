import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/LoginScreen/login_screen.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';
import '../../../UiHelper/utilities/widgets/custom_primary_button.dart';
import '../sharedWidgets/account_login_widget.dart';
import '../sharedWidgets/auth_title.dart';
import '../sharedWidgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
            spacing: 25,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthTitle(
                title: "Create your free account!",
                subtitle: "Already have an account? ",
                postSubtitle: "Sign In",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              Column(
                spacing: 10,
                children: [
                  CustomTextField(
                    title: "E-mail",
                    hint: "abc@gmail.com",
                    controller: emailController,
                  ),
                  CustomTextField(
                    title: "Password",
                    hint: "1234",
                    isPass: true,
                    controller: passController,
                  ),
                  AccountLoginWidget(title: "or Login with"),
                  SizedBox(height: size.height / 3.2),
                  CustomPrimaryButton(btnName: "Sign In", onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
