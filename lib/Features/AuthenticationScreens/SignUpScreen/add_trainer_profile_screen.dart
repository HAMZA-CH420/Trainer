import 'package:flutter/material.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

class AddTrainerProfileScreen extends StatelessWidget {
  const AddTrainerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashTitle(title: "Update Profile"),
        centerTitle: true,
      ),
    );
  }
}
