import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/TrainerProfile/trainer_profile.dart';
import 'package:trainer/UIhelper/colorPalette/color_palette.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

class TrainerList extends StatefulWidget {
  const TrainerList({super.key});

  @override
  State<TrainerList> createState() => _TrainerListState();
}

class _TrainerListState extends State<TrainerList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Expanded(
      child: FutureBuilder(
        future: context.watch<DbProvider>().getTrainerProfiles(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Unknown Error"));
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "No Trainers Available",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                if (data?[index]["userId"] == checkUser()) {
                  return SizedBox.shrink();
                }
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Palette.primaryColor,
                    child: Icon(Icons.person, color: Colors.white, size: 22),
                  ),
                  title: Text(
                    data?[index]["userName"],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    data?[index]["userName"],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: viewProfile(size, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainerProfile()),
                    );
                  }),
                );
              },
            );
          }
        },
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

  Future<String?> checkUser() async {
    var pref = await SharedPreferences.getInstance();
    var isCurrentUser = pref.getString("userId");
    return isCurrentUser;
  }
}
