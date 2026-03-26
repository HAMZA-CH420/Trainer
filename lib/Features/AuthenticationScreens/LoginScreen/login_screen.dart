import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/account_login_widget.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/auth_title.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/Features/homescreen/home_screen.dart';
import 'package:trainer/Services/AuthServices/validator.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                title: "Login to your account!",
                subtitle: "Don't have an account? ",
                postSubtitle: "Sign up",
                onTap: () {},
              ),
              Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    CustomTextField(
                      title: "E-mail",
                      hint: "abc@gmail.com",
                      controller: emailController,
                      validator: (value) => FieldValidator.validateEmail(value),
                    ),
                    CustomTextField(
                      title: "Password",
                      hint: "1234",
                      isPass: true,
                      controller: passController,
                      validator: (value) =>
                          FieldValidator.validatePassword(value),
                    ),
                    AccountLoginWidget(title: "or Login with"),
                    SizedBox(height: size.height / 3.2),
                    CustomPrimaryButton(
                      btnName: "Sign In",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
