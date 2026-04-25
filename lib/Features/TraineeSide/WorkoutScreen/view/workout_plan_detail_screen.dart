import 'package:flutter/material.dart';
import 'package:trainer/Features/TraineeSide/DashboardScreen/widgets/dash_title.dart';
import 'package:trainer/UiHelper/utilities/widgets/pop_button.dart';

class WorkoutPlanDetailScreen extends StatelessWidget {
  const WorkoutPlanDetailScreen({super.key, required this.workoutName});

  final String workoutName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopButton(),
        title: DashTitle(title: workoutName),
        centerTitle: true,
      ),
    );
  }
}
