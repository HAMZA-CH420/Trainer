import 'package:flutter/material.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

class TrainerProfile extends StatelessWidget {
  const TrainerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashTitle(title: "Trainer Profile"),
        centerTitle: true,
      ),
    );
  }
}
