import 'package:flutter/material.dart';

class LearningPlanPage extends StatefulWidget {
  const LearningPlanPage({super.key});

  @override
  State<LearningPlanPage> createState() => _LearningPlanPageState();
}

class _LearningPlanPageState extends State<LearningPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 84),
        child: const Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                "My Learning Plan",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Text("Right now this section is on work You'll be able to use it soon")
            ],
          ),
        ),
      )
    );
  }
}