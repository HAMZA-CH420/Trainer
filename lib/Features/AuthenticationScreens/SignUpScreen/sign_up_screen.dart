import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainer/Features/AuthenticationScreens/LoginScreen/login_screen.dart';
import 'package:trainer/Features/AuthenticationScreens/SignUpScreen/verification_screen.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/radio_widget.dart';

import 'package:trainer/Services/AuthServices/validator.dart';
import 'package:trainer/viewModel/Providers/AuthenticationProviders/sign_up_provider.dart';

import '../../../UIhelper/colorPalette/color_palette.dart';
import '../../../UiHelper/utilities/widgets/custom_primary_button.dart';
import '../sharedWidgets/account_login_widget.dart';
import '../sharedWidgets/auth_title.dart';
import '../sharedWidgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.type});

  final String type;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 10,
                    children: [
                      CustomTextField(
                        title: "Username",
                        hint: "i.e Hamza",
                        controller: usernameController,
                        validator: (value) =>
                            FieldValidator.validateUsername(value),
                      ),
                      CustomTextField(
                        title: "E-mail",
                        hint: "abc@gmail.com",
                        controller: emailController,
                        validator: (value) =>
                            FieldValidator.validateEmail(value),
                      ),
                      CustomTextField(
                        title: "Password",
                        hint: "1234",
                        isPass: true,
                        controller: passController,
                        validator: (value) =>
                            FieldValidator.validatePassword(value),
                      ),
                      CustomTextField(
                        title: "Phone Number",
                        hint: "+92 123456789",
                        controller: phoneController,
                        validator: (value) =>
                            FieldValidator.validatePhoneNumber(value),
                      ),
                      AccountLoginWidget(title: "or Connect with"),
                      RadioWidget(),
                      SizedBox(height: size.height / 14),
                      CustomPrimaryButton(
                        btnName: "Continue",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpProvider>().createUser(
                              userName: usernameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passController.text.trim(),
                              phoneNumber: phoneController.text
                                  .toString()
                                  .trim(),
                              type: widget.type,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
