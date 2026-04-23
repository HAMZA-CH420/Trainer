import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/Drawer/widget/drawer_helper_widget.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

import '../../../../../../UIhelper/colorPalette/color_palette.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUserData = context.read<DbProvider>().getUserDetails();
    return Drawer(
      elevation: 1.5,
      shape: BeveledRectangleBorder(),
      width: MediaQuery.sizeOf(context).width / 1.3,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
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
                  Text(
                    "",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              DrawerHelperWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
