import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  const TaskTile({super.key, required this.taskName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 8),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.trackerBorder, width: 6))),
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (value){}),
            Text(
              taskName,
              style: const TextStyle(fontSize: 22),
            ),
            const Expanded(child: SizedBox()),
            const Text("27.08.2024")
          ],
        ),
      ),
    );
  }
}