import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/progress_widget_button.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  final List<String> actions = ["Workouts", "Goals"];
  final List<Color> colors = [Colors.green, Colors.orange];
  final List icons = [
    HugeIcons.strokeRoundedBodyPartMuscle,
    HugeIcons.strokeRoundedTarget01,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Wrap(
      spacing: 15,

      children: List.generate(actions.length, (index) {
        return Container(
          height: size.height / 5,
          width: size.width / 2.4,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            spacing: 10,
            children: [
              HugeIcon(icon: icons[index], size: 55, color: colors[index]),
              Column(
                children: [
                  Text(
                    actions[index],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Track your progress",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ],
              ),
              ProgressWidgetButton(btnName: "View", onTap: () {}),
            ],
          ),
        );
      }),
    );
  }
}
