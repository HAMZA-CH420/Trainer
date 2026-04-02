import 'package:flutter/material.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/widgets/custom_search_bar.dart';
import 'package:trainer/Features/DashboardScreen/widgets/dash_title.dart';

import '../../../../UIhelper/colorPalette/color_palette.dart';

class FindTrainerScreen extends StatelessWidget {
  const FindTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(context));
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
      ),
      title: DashTitle(title: "Find a Trainer"),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: Colors.orange,
            child: Column(children: [CustomSearchBar(), SizedBox(height: 60)]),
          ),
        ),
      ),
    );
  }
}
