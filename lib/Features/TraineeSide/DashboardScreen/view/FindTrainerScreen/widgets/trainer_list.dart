import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/TrainerProfile/trainer_profile.dart';
import 'package:trainer/UiHelper/colorPalette/color_palette.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

class TrainerList extends StatefulWidget {
  final String searchQuery;

  const TrainerList({super.key, this.searchQuery = ""});

  @override
  State<TrainerList> createState() => _TrainerListState();
}

class _TrainerListState extends State<TrainerList> {
  String? currentUserId;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      currentUserId = pref.getString("userId");
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: context.read<DbProvider>().getTrainerProfiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading trainers"));
          }

          final allTrainers = snapshot.data ?? [];

          // Filter out current user and apply search query
          final filteredTrainers = allTrainers.where((trainer) {
            final isNotMe = trainer["userId"] != currentUserId;
            final nameMatches = trainer["userName"]
                .toString()
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase());
            final specMatches = trainer["specialization"]
                .toString()
                .toLowerCase()
                .contains(widget.searchQuery.toLowerCase());

            return isNotMe && (nameMatches || specMatches);
          }).toList();
          ////
          if (filteredTrainers.isEmpty) {
            return Center(
              child: Text(
                widget.searchQuery.isEmpty
                    ? "No Trainers Available"
                    : "No results for \"${widget.searchQuery}\"",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredTrainers.length,
            itemBuilder: (context, index) {
              final trainer = filteredTrainers[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Palette.primaryColor,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                title: Text(
                  trainer["userName"] ?? "Unknown",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  trainer["specialization"] ?? "General",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: viewProfile(size, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrainerProfile(
                        specialization: trainer["specialization"],
                        name: trainer["userName"],
                        experience: trainer["experience"],
                        about: trainer["about"],
                      ),
                    ),
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }

  Widget viewProfile(Size size, VoidCallback onTap) {
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
