import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/custom_text_field.dart';
import 'package:trainer/Features/AuthenticationScreens/sharedWidgets/description_widget.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/Features/TrainerSide/TrainerDashboardScreen/trainer_dashboard_screen.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';
import 'package:trainer/UiHelper/utilities/widgets/custom_primary_button.dart';
import 'package:trainer/UiHelper/utilities/widgets/toast_message.dart';
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
    rateController.dispose();
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
                  child: const Icon(
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
                const SizedBox(height: 20),
                CustomPrimaryButton(
                  btnName: "Upload",
                  onTap: () async {
                    if (nameController.text.isEmpty ||
                        specController.text.isEmpty ||
                        expController.text.isEmpty ||
                        rateController.text.isEmpty ||
                        descController.text.isEmpty) {
                      ToastMessage.showToast(
                        message: "Please fill all fields",
                        isError: true,
                      );
                      return;
                    }

                    final pref = await SharedPreferences.getInstance();
                    var userId = pref.getString("userId");
                    
                    if (userId == null) {
                       ToastMessage.showToast(
                        message: "User session expired. Please login again.",
                        isError: true,
                      );
                      return;
                    }

                    bool saved = await context.read<DbProvider>().addTrainerProfile(
                          userId: userId,
                          username: nameController.text.trim(),
                          about: descController.text.trim(),
                          specialization: specController.text.trim(),
                          experience: expController.text.trim(),
                          hourlyRate: rateController.text.trim(),
                          rating: 0.0,
                        );

                    if (saved) {
                      if (mounted) {
                        ToastMessage.showToast(
                          message: "Profile updated successfully",
                          isError: false,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TrainerDashboardScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    } else {
                      ToastMessage.showToast(
                        message: "Failed to update profile",
                        isError: true,
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
