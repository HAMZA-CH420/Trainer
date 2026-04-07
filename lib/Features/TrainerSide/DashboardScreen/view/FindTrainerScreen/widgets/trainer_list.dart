import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trainer/Features/TrainerSide/DashboardScreen/view/TrainerProfile/trainer_profile.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';

class TrainerList extends StatefulWidget {
  const TrainerList({super.key});

  @override
  State<TrainerList> createState() => _TrainerListState();
}

class _TrainerListState extends State<TrainerList> {
  final List<Map<String, dynamic>> dummyTrainerList = [
    {"name": "Sarah", "specialization": "Yoga & Pilates"},
    {"name": "Alex", "specialization": "Strength Training"},
    {"name": "Ben", "specialization": "Cardio & Endurance"},
    {"name": "Emily", "specialization": "Nutrition & Wellness"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final String name = "Coach ${dummyTrainerList[index]["name"]}";
          final String specialization =
              dummyTrainerList[index]["specialization"];

          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Palette.primaryColor,
              child: Icon(Icons.person, color: Colors.white, size: 22),
            ),
            title: Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              specialization,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
            trailing: viewProfile(size, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrainerProfile()),
              );
            }),
          );
        },
        itemCount: dummyTrainerList.length,
      ),
    );
  }

  Widget viewProfile(var size, var onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,

        height: size.height * .04,
        width: size.width * .27,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Palette.primaryColor),
        ),
        child: Text(
          "View Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Palette.primaryColor,
          ),
        ),
      ),
    );
  }
}
