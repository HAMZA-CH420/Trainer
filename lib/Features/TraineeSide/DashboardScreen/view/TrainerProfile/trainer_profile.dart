import 'package:flutter/material.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

import '../../../../../UIhelper/colorPalette/color_palette.dart';

class TrainerProfile extends StatelessWidget {
  const TrainerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
        ),
        title: DashTitle(title: "Trainer Profile"),
        centerTitle: true,
      ),
    );
  }
}
