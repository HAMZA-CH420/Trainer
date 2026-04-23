import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/Drawer/widget/drawer_helper_widget.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';
import '../../../../../../UiHelper/colorPalette/color_palette.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1.5,
      shape: const BeveledRectangleBorder(),
      width: MediaQuery.sizeOf(context).width / 1.3,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: FutureBuilder<Map<String, dynamic>?>(
            future: context.read<DbProvider>().getUserDetails(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              
              final userData = snapshot.data;
              final userName = userData?['userName'] ?? "Guest User";

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
                      ),
                      Expanded(
                        child: Text(
                          userName,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const DrawerHelperWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
