import 'package:flutter/material.dart';
import 'package:time_tracker/generated/l10n.dart';

class CurrentAcitiviyDisplayer extends StatelessWidget {
  final String activityName;
  final int activitySessions;
  const CurrentAcitiviyDisplayer({super.key, required this.activityName, required this.activitySessions});

  @override
  Widget build(BuildContext context) {
    if (activitySessions != 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).currentlyWorkingOn,
            style: const TextStyle(fontSize: 36, color: Color.fromARGB(255, 99, 103, 148), height: 1.0),
          ),
          Text(
            activityName,
            style: const TextStyle(fontSize: 42, color: Color.fromARGB(255, 52, 55, 88), height: 1.0),
          ),
          Text(
            S.of(context).itsYourNSession(activitySessions),
            style: const TextStyle(fontSize: 17, color: Color.fromARGB(255, 112, 116, 173), height: 1.0),
          ),
        ],
      );
    } 
    else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).currentlyWorkingOn,
            style: const TextStyle(fontSize: 24),
          ),
          const Text(
            "Nothing",
            style: TextStyle(fontSize: 42),
          ),
        ],
      );
    }
  }
}