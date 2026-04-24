import 'package:flutter/material.dart';

import 'package:trainer/Features/TraineeSide/DashboardScreen/view/FindTrainerScreen/widgets/custom_search_bar.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/view/MessagesScreen/widgets/message_list.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';

import '../../../../../../UIhelper/colorPalette/color_palette.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Palette.primaryColor),
        ),
        title: DashTitle(title: "Messages"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomSearchBar(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              hintTxt: "Messages",
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: MessageList(searchQuery: searchQuery),
      ),
    );
  }
}
