import 'package:flutter/material.dart';
import 'package:time_tracker/generated/l10n.dart';

class CurrentAcitiviyDisplayer extends StatelessWidget {
  final String activityName;
  final int activitySessions;
  const CurrentAcitiviyDisplayer({super.key, required this.activityName, required this.activitySessions});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).currentlyWorkingOn),
        Text(
          activityName,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          S.of(context).itsYourNSession(activitySessions),
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}