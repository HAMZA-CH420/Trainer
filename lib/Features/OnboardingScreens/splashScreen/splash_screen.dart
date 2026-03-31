import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/AuthenticationScreens/LoginScreen/login_screen.dart';

import '../../../UiHelper/colorPalette/color_palette.dart';
import '../introProvider/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigation();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Center(
        child: Column(
          spacing: size.height / 6,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: size.height / 13),
            SizedBox(
              height: size.height / 4,
              width: size.width / 2,
              child: SvgPicture.asset("assets/logo/logo.svg"),
            ),
            SizedBox(
              width: size.width / 2.5,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white38,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigation() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogged = pref.getBool("userLogged") ?? false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => isLogged ? LoginScreen() : IntroScreen(),
          ),
        );
      });
    });
  }
}
