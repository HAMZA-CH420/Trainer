import 'package:flutter/material.dart';
import 'package:trainer/Features/DashboardScreen/widgets/dash_title.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DashTitle(title: "Invite a Friend"),
        centerTitle: true,
      ),
    );
  }
}
