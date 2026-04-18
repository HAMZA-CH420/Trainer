import 'package:flutter/material.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/TrainerProfile/widgets/trainer_about.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

import '../../../../../UIhelper/colorPalette/color_palette.dart';

class TrainerProfile extends StatefulWidget {
  const TrainerProfile({
    super.key,
    required this.name,
    required this.specialization,
    required this.experience,
    required this.about,
  });

  final String name, specialization, experience, about;

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: TrainerAbout(
                experience: widget.experience,
                name: widget.name,
                specialization: widget.specialization,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
