import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class CompletedTasksText extends StatelessWidget {

  final int  overallTasksCompleted;
  final int todayTasksCompleted;

  const CompletedTasksText({super.key, required this.overallTasksCompleted, required this.todayTasksCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.trackerContainerBackground,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Text(
                  S.of(context).overallTasksCompleted,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.trackerStartButton,
                    height: 1.0
                  ),
                ),
                Text(
                  "$overallTasksCompleted",
                  style: const TextStyle(
                    fontSize: 42,
                    height: 1.0
                  ),
                )
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/30),
                Text(
                  S.of(context).tasksCompletedToday,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.trackerStartButton,
                    height: 1.0
                  ),
                ),
                Text(
                  "$todayTasksCompleted",
                  style: const TextStyle(
                    fontSize: 42,
                    height: 1.0
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}