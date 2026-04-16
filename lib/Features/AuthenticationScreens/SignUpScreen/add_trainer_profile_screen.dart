import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

class AddTrainerProfileScreen extends StatefulWidget {
  const AddTrainerProfileScreen({super.key});

  @override
  State<AddTrainerProfileScreen> createState() =>
      _AddTrainerProfileScreenState();
}

class _AddTrainerProfileScreenState extends State<AddTrainerProfileScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashTitle(title: "Update Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTextField(
            title: "Name",
            hint: "Your Name",
            controller: nameController,
          ),
        ],
      ),
    );
  }
}
