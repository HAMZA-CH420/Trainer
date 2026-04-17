import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/description_widget.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

class AddTrainerProfileScreen extends StatefulWidget {
  const AddTrainerProfileScreen({super.key});

  @override
  State<AddTrainerProfileScreen> createState() =>
      _AddTrainerProfileScreenState();
}

class _AddTrainerProfileScreenState extends State<AddTrainerProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController specController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController rateController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    specController.dispose();
    expController.dispose();
    descController.dispose();
    FocusManager.instance.primaryFocus!.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: DashTitle(title: "Update Profile"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
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
                CustomTextField(
                  title: "Experience",
                  hint: "time in years",
                  controller: expController,
                ),
                CustomTextField(
                  title: "Hourly Rate",
                  hint: "i.e 20\$",
                  controller: rateController,
                ),
                DescriptionWidget(
                  title: "About",
                  hint: "write about yourself",
                  controller: descController,
                ),
                CustomPrimaryButton(
                  btnName: "Upload",
                  onTap: () async {
                    final pref = await SharedPreferences.getInstance();
                    var userId = pref.getString("userId");
                    context.read<DbProvider>().addTrainerProfile(
                      userId: userId.toString(),
                      username: nameController.text,
                      about: descController.text,
                      specialization: specController.text,
                      experience: expController.text,
                      hourlyRate: rateController.text,
                      rating: 0.0,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
