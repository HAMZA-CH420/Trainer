import 'package:flutter/material.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class AddTrainerProfileScreen extends StatefulWidget {
  const AddTrainerProfileScreen({super.key});

  @override
  State<AddTrainerProfileScreen> createState() =>
      _AddTrainerProfileScreenState();
}

class _AddTrainerProfileScreenState extends State<AddTrainerProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController specController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashTitle(title: "Update Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Palette.primaryColor,
              child: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.white,
                size: 38,
              ),
            ),
            CustomTextField(
              title: "Name",
              hint: "Your Name",
              controller: nameController,
            ),
            CustomTextField(
              title: "Specialization",
              hint: "i.e Strength trainer",
              controller: specController,
            ),
          ],
        ),
      ),
    );
  }
}
