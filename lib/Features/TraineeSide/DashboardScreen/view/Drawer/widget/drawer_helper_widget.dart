import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DrawerHelperWidget extends StatelessWidget {
  const DrawerHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: HugeIcon(icon: HugeIcons.strokeRoundedMessage01),
          ),
        ],
      ),
    );
  }
}
