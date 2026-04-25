import 'package:flutter/material.dart';

import '../../colorPalette/color_palette.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
    );
  }
}
