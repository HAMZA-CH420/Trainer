import 'package:flutter/material.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/invite_friend_screen.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/widgets/custom_search_bar.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/widgets/discount_and_invite_widget.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/widgets/filter_widget.dart';
import 'package:trainer/Features/DashboardScreen/view/FindTrainerScreen/widgets/trainer_list.dart';
import 'package:trainer/Features/DashboardScreen/widgets/dash_title.dart';

import '../../../../UIhelper/colorPalette/color_palette.dart';

class FindTrainerScreen extends StatelessWidget {
  const FindTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          spacing: 5,
          children: [
            DiscountAndInviteWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InviteFriendScreen()),
                );
              },
            ),
            TrainerList(),
          ],
        ),
      ),
    );
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
        preferredSize: Size.fromHeight(110),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              CustomSearchBar(onChanged: (query) {}),
              FilterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
