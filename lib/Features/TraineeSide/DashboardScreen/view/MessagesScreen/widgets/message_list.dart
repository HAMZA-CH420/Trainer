import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../UiHelper/colorPalette/color_palette.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final List<Map<String, dynamic>> messages = [
    {"name": "Coach Alex", "msg": "see you tomorrow!"},
    {"name": "Coach Ben", "msg": "How are you feeling?"},
    {"name": "Coach Sarah", "msg": "Great job today."},
    {"name": "Coach Emily", "msg": "Let's meet tomorrow."},
  ];

  @override
  Widget build(BuildContext context) {
    final filteredMessages = messages.where((message) {
      final name = message["name"].toString().toLowerCase();
      final msg = message["msg"].toString().toLowerCase();
      final query = widget.searchQuery.toLowerCase();
      return name.contains(query) || msg.contains(query);
    }).toList();

    return Flexible(
      child: filteredMessages.isEmpty
          ? Center(
              child: Text(
                "No messages found",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: filteredMessages.length,
              itemBuilder: (context, index) {
                final message = filteredMessages[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Palette.primaryColor,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    message["name"],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(message["msg"], style: GoogleFonts.poppins()),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.primaryColor,
                    size: 16,
                  ),
                );
              },
            ),
    );
  }
}
