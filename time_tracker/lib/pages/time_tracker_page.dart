import 'package:flutter/material.dart';

class TimeTrackerPage extends StatefulWidget {
  const TimeTrackerPage({super.key});

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {
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
                "Time Tracker Page",
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