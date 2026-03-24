import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../UiHelper/colorPalette/color_palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 4,
              width: size.width / 2,
              child: SvgPicture.asset("assets/logo/Logo(trainer).svg"),
            ),
            LinearProgressIndicator(backgroundColor: Colors.white38,borderRadius: BorderRadius.circular(10),color: Colors.white,),
          ],
        ),
      ),
    );
  }
}


